class SellingsController < ApplicationController

  def index
    user = User.find(current_user.id)
    @sellings = user.items.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
  end

end
