class SignupController < ApplicationController

  def registration

  end

  def authentication
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    # session[:encrypted_password] = user_params[:encrypted_password]
    session[:password] = user_params[:password]
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday] = user_params[:birthday]
  end

  def address
    
  end

  def credit
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:city_block] = user_params[:city_block]
    session[:building] = user_params[:building]
    session[:tel_number] = user_params[:tel_number]
  end

  def completed
    # session[:tel_number] = user_params[:tel_number]
    Payjp.api_key = 'sk_test_04387e0973780d6cbbb78c9e' #pay.jpの秘密キー
    if pay_params['payjp_token'].blank?
        render :completed
    else  
        customer = Payjp::Customer.create(card: pay_params[:payjp_token])  #顧客作成
        @user = User.new(
         nickname: session[:nickname],
        #  email: session[:email],
        #  encrypted_password: session[:encrypted_password],
         email: session[:email],
         password: session[:password],
         lastname: session[:lastname],
         firstname: session[:firstname],
         lastname_kana: session[:lastname_kana],
         firstname_kana: session[:firstname_kana],
         birthday: session[:birthday],
         postal_code: session[:postal_code],
         prefecture: session[:prefecture],
         city: session[:city],
         city_block: session[:city_block],
         building: session[:building],
         tel_number: session[:tel_number],
         customer_id: customer.id,
         card_id: customer.default_card
        )
        
        # User.save
        binding.pry
        # customer.credit.create(card: params[:payjp_token])      #上の顧客のカード作成   
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
      :user_image,
      :point,
      :postal_code,
      :prefecture,
      :city,
      :city_block,
      :building,
      :tel_number,
      :email,
      :password,
      # :encrypted_password,
      # :customer_id,
      # :card_id,
      :provider,
      :uid
    )
  end

  def pay_params
    params.permit(:payjp_token)
  end

end
