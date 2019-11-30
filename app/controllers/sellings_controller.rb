class SellingsController < ApplicationController
  before_action :selling_to_show, only: [:show]
  def index
    user = User.find(current_user.id)
    @sellings = user.items.page(params[:page]).per(10).order("created_at DESC")
  end
  def show
    @item = Item.find(params[:id])
  end
  

  def edit
  end
  def destroy 
    item = Item.find(params[:id])
    item.destroy! if item.user_id == current_user.id
    #destroyメソッドを使用し対象のツイートを削除する。
    redirect_to user_sellings_path
  end
  private
  def selling_to_show
    item = Item.find_by(id: params[:id])
    if item.user_id != current_user.id
      redirect_to root_path
    end
  end
  
end
