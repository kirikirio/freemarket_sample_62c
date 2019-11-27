class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def clear_flash
    flash[:email] = nil
    flash[:password] = nil
    flash[:nickname] = nil
    flash[:lastname] = nil
    flash[:firstname] = nil
    flash[:lastname_kana] = nil
    flash[:firstname_kana] = nil
    flash[:birthday] = nil
    flash[:tel_number] = nil
    flash[:postal_code] = nil
    flash[:prefecture_id] = nil
    flash[:city] = nil
    flash[:city_block] = nil
    flash[:base] = nil #recaptcha
  end

  def clear_session
    session[:email] = nil
    session[:password] = nil
    session[:nickname] = nil
    session[:lastname] = nil
    session[:firstname] = nil
    session[:lastname_kana] = nil
    session[:firstname_kana] = nil
    session[:birthday] = nil
    session[:tel_number] = nil
    session[:postal_code] = nil
    session[:prefecture_id] = nil
    session[:city] = nil
    session[:city_block] = nil
    session[:building] = nil
  end
  
end