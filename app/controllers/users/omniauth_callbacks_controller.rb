# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook   
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google_oauth2)
  end

private

  def callback_for(provider)
    provider = provider.to_s
            # userモデルに定義したfind_oauthメソッド
    @user = User.find_oauth(request.env["omniauth.auth"])

    #-----------
      session[:uid] = @user.uid
      session[:provider] = @user.provider
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:user_image] = request.env["omniauth.auth"].info.image
      session[:password] = @user.password
    #-----------
    
    if @user.persisted?       #userが存在したら。
      sign_in_and_redirect @user, event: :authentication  #after_sign_in_path_forと同じ。（ログイン時実行されるメソッド、ログイン時に飛んでほしいページを指定）
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else    #userが存在しない場合
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")   
      redirect_to controller:"/signup", action:"registration"      #会員情報入力ページに飛ばす
    end
  end

  def failure
    redirect_to root_path and return  #失敗したらトップページに飛ばす。
  end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
