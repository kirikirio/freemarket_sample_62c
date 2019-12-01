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
    @item = Item.find(params[:id])
    @items = Item.all
    @categorys = Category.all
    @oya = Category.find(@item.category_id).parent.parent.siblings
    @mago = Category.find(@item.category_id).siblings
    @childrens = Category.find(@item.category_id).root.children
    @tesuryo = (@item.price)*(0.1)
    @rieki = (@item.price) - (@item.price)*(0.1)
    @parents = Category.roots
    @sizes = Size.all
    @brands = Brand.all
    @item_statuses = ItemStatus.all
    @prefectures = Prefecture.all
    @delivery_statuses = DeliveryStatus.all
    @delivery_methods = DeliveryMethod.all
    @delivery_fee = ['着払い','送料込み']
  end

  def update
    @item = Item.find(params[:id])
    if @item.images.blank?
      @item.images.build
      flash.now[:alert] = '画像をアップロードしてください。'
      render 'items/edit' and return
    end
    if @item.update(item_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def delete
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
      private

  def item_params
    params.require(:item).permit(
                            :name,
                            :price,
                            :description,
                            :item_status_id,
                            :sale_status_id,
                            :size_id,
                            :brand_id, 
                            :delivery_status_id,
                            :prefecture_id,
                            :category_id,
                            :delivery_fee,
                            :delivery_method_id,
                            images_attributes: [:id, :image, :_destory]
                          ).merge(
                            user_id: current_user.id
                          )
  end
end
