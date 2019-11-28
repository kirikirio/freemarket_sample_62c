class SellingsController < ApplicationController

  def index
    user = User.find(1)
    @sellings = user.items.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
  end

end
