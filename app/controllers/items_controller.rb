class ItemsController < ApplicationController
  before_action :set_submodel, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    # js非同期処理
    if (params[:parentId])
      parent = Category.find(params[:parentId])
      @children = parent.children
    end
    respond_to do |format|
      format.html
      format.json { render json: @children}
    end
  end

  def edit
    @item = Item.find(params[:id])
    @items = Item.all
    @brands = Brand.all
    @categorys = Category.all
    @size = Size.all
    @item_statuses = ItemStatus.all
    @sale_statuses = SaleStatus.all
    @delivery_statuses = DeliveryStatus.all
    @delivery_methods = DeliveryMethod.all
    @prefecture = Prefecture.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to action: 'index'
  end

  def create
    @item = Item.new(item_params)
    if @item.images == []
      flash.now[:alert] = '必須項目を入力してください。'
      render 'items/new' and return
    end

    if @item.save
      redirect_to new_item_path, notice: '送信しました'
    else
      flash.now[:alert] = '必須項目を入力してください。'
      render :new
    end
  end

  def delete
  end

  def confirmation
  end

  def list
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
                            images_attributes: [:id, :image]
                          ).merge(
                            user_id: 1
                          )
  end

  def set_submodel
    @parents = Category.roots
    @sizes = Size.all
    @brands = Brand.all
    @item_statuses = ItemStatus.all
    @prefectures = Prefecture.all
    @delivery_statuses = DeliveryStatus.all
    @delivery_method = DeliveryMethod.all
    @delivery_fee = ['着払い','送料込み']

#   def item_params
#     params.require(:item).permit(:name,:description,:delivery_fee,:price,:brand_id,:prefecture_id,:category_id,:size_id,:item_status_id,:sale_status_id,:delivery_status_id,:delivery_method_id,
#     images_attributes: [:id, :image]).merge(
#       name: 'パーカー', price: 3000, description: '商品の説明',
#       item_status_id: 1,size_id: 1,brand_id:1,
#       delivery_status_id: 1,prefecture_id: 1, category_id: 1,delivery_fee: 1,
#       user_id: 1, sale_status_id: 1,delivery_method_id: 1 )
#   end

end