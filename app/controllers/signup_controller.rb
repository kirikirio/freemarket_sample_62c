class SignupController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :validates_registration, only: :authentication
  before_action :validates_authentication, only: :address
  before_action :validates_address, only: :credit
  after_action  :clear_session, only: :completed
  prepend_before_action :clear_flash

  def registration
    session[:password]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
    )
  end

  def authentication
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday] = user_params['birthday(1i)'] + "/" + user_params['birthday(2i)'] + "/" + user_params['birthday(3i)']
  end

  def address
    @user = User.new(
      lastname: session[:lastname],
      firstname: session[:firstname],
      lastname_kana: session[:lastname_kana],
      firstname_kana: session[:firstname_kana],
      tel_number: user_params[:tel_number]
    )
    session[:tel_number] = user_params[:tel_number]
  end

  def credit
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:city_block] = user_params[:city_block]
    session[:building] = user_params[:building]
    session[:tel_number] = user_params[:tel_number]
    gon.setPublicKey = ENV['SET_PUBLIC_KEY']
  end

  def completed
    Payjp.api_key = ENV['PAYJP_API_KEY'] #pay.jpの秘密キー
    if pay_params['payjp_token'].blank?
        render :completed
    else  
        customer = Payjp::Customer.create(card: pay_params[:payjp_token])  #顧客作成
        @user = User.new(
          nickname: session[:nickname],
          email: session[:email],
          password: session[:password],
          lastname: session[:lastname],
          firstname: session[:firstname],
          lastname_kana: session[:lastname_kana],
          firstname_kana: session[:firstname_kana],
          birthday: session[:birthday],
          postal_code: session[:postal_code],
          prefecture_id: session[:prefecture_id],
          city: session[:city],
          city_block: session[:city_block],
          building: session[:building],
          tel_number: session[:tel_number],
          uid: session[:uid],
          provider: session[:provider],
          customer_id: customer.id,
          card_id: customer.default_card
        )
        sign_in @user if @user.save

    end
    
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :nickname,
      :profile,
      :birthday,
      'birthday(1i)',
      'birthday(2i)',
      'birthday(3i)',
      :user_image,
      :point,
      :postal_code,
      :prefecture_id,
      :city,
      :city_block,
      :building,
      :tel_number,
      :email,
      :password,
      :customer_id,
      :card_id,
      :provider,
      :uid,
      :card_number,
      :exp_month,
      :exp_year,
      :cvc
    )
  end

  def pay_params
    params.permit(:payjp_token)
  end

  def validates_registration

    @user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      nickname: user_params[:nickname],
      lastname: user_params[:lastname],
      firstname: user_params[:firstname],
      lastname_kana: user_params[:lastname_kana],
      firstname_kana: user_params[:firstname_kana],
      birthday: user_params['birthday(1i)'] + "/" + user_params['birthday(2i)'] + "/" + user_params['birthday(3i)']
    )

    # エラー確認。また、@user.errors.detailsにエラー内容を記載するため
    if @user.valid?(:validates_registration)
    
      # recaptchaのエラー確認をして、userモデルにエラーを追加
      unless verify_recaptcha(model: @user, secret_key: ENV['RECAPTCHA_SECRET_KEY'])
        flash[:base] = "選択してください"
        render action: :registration
      end

    else

      flash[:base] = "選択してください" unless verify_recaptcha(model: @user, secret_key: ENV['RECAPTCHA_SECRET_KEY'])
      @user.errors.details.keys.each do |key|
        case key
        when :email then
          if @user.errors.details[:email][0][:error] == :blank
            flash[:email] = "メールアドレスを入力してください"
          else
            flash[:email] = "このメールアドレスはすでに使用されています"
          end
        when :password then
          flash[:password] = {a: "パスワードを入力してください", b: "パスワードは7文字以上128文字以下で入力してください", c: "英字と数字両方を含むパスワードを設定してください"}
        when :nickname then
          flash[:nickname] = "ニックネームを入力してください"
        when :lastname then
          flash[:lastname] = "性を入力してください"
        when :firstname then
          flash[:firstname] = "名を入力してください"
        when :lastname_kana then
          flash[:lastname_kana] = "性カナを入力してください"
        when :firstname_kana then
          flash[:firstname_kana] = "名カナを入力してください"
        when :birthday then
          flash[:birthday] = "生年月日を正しく入力してください"
        end
      end
      render action: :registration
    end
  end

  def validates_authentication

    @user = User.new(
      tel_number: user_params[:tel_number]
    )

    unless @user.valid?(:validates_authentication)
      @user.errors.details.keys.each do |key|
        case key
        when :tel_number then
          flash[:tel_number] = "電話番号を正しく入力してください"
          render action: :authentication
        end
      end
    end

  end


  def validates_address

    # emailとpasswordは常にバリデーションチェックをしているため入力
    @user = User.new(
      email: session[:email],
      password: session[:password],
      lastname: user_params[:lastname],
      firstname: user_params[:firstname],
      lastname_kana: user_params[:lastname_kana],
      firstname_kana: user_params[:firstname_kana],
      postal_code: user_params[:postal_code],
      prefecture_id: user_params[:prefecture_id],
      city: user_params[:city],
      city_block: user_params[:city_block],
      building: user_params[:building],
      tel_number: user_params[:tel_number]
    )

    # エラー確認。また、@user.errors.detailsにエラー内容を記載するため
    unless @user.valid?(:validates_address)
      @user.errors.details.keys.each do |key|
        case key
        when :lastname then
          flash[:lastname] = "性を入力してください"
        when :firstname then
          flash[:firstname] = "名を入力してください"
        when :lastname_kana then
          flash[:lastname_kana] = "性カナを入力してください"
        when :firstname_kana then
          flash[:firstname_kana] = "名カナを入力してください"
        when :postal_code then
          flash[:postal_code] = "郵便番号を正しく入力してください"
        when :prefecture_id then
          flash[:prefecture_id] = "都道府県を正しく入力してください"
        when :city then
          flash[:city] = "市区町村を入力してください"
        when :city_block then
          flash[:city_block] = "番地を入力してください"
        end
      end
      render action: :address
    end
  end
  
end