class UsersController < ApplicationController


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