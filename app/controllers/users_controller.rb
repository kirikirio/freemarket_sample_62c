class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :select_singup
  before_action :clear_flash, only: :select_singup
  before_action  :clear_session, only: :select_singup

  def show
    @user = User.find(current_user.id)
  end

  def logout
  end

  # 新規会員登録
  def select_singup
  end

  def profile
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

end