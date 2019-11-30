class UsersController < ApplicationController
  before_action :set_user

  def show

  end

  def logout
  end

  # 新規会員登録
  def select_singup
  end

  def profile

  end

  def edit
    
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

end