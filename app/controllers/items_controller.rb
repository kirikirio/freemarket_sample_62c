class ItemsController < ApplicationController

  def index
    @ladies_ids = Category.find(1).subtree_ids
    @ladies = Item.limit(10).where(category_id: @ladies_ids)

    @man_ids = Category.find(200).subtree_ids
    @men = Item.limit(10).where(category_id: @man_ids)

    @home_ids = Category.find(898).subtree_ids
    @homes = Item.limit(10).where(category_id: @home_ids)

    @toy_ids = Category.find(685).subtree_ids
    @toys = Item.limit(10).where(category_id: @toy_ids)

    @chanel_ids = Brand.find(1)
    @chanels = Item.limit(10).where(brand_id: @chanel_ids)

    @lv_ids = Brand.find(2)
    @lvs = Item.limit(10).where(brand_id: @lv_ids)

    @supreme_ids = Brand.find(3)
    @supremes = Item.limit(10).where(brand_id: @supreme_ids)
    
    @nike_ids = Brand.find(4)
    @nikes = Item.limit(10).where(brand_id: @nike_ids)

  end

  def new
    @item = Item.new
    10.times{@item.images.build}
    # binding.pry
    # @image = @item.images.build
    # @image = @item.images.build
    # @image = @item.images.build
    # @image = Image.new

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
  #   @item = Item.find(params[:id])
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
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to action: 'index'
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      
      render :new
    end
  end

  def delete
  end

  def confirmation
  end

  def list
  end

  def item_params
    params.require(:item).permit(:name,:description,:delivery_fee,:price,:brand_id,:prefecture_id,:category_id,:size_id,:item_status_id,:sale_status_id,:delivery_status_id,:delivery_method_id,
    images_attributes: [:id,:image,:item_id,:_destroy])
    .merge(name: 'パーカー', price: 3000, description: '商品の説明',
  item_status_id: 1,sale_status_id: 1,size_id: 1,brand_id:1,
  delivery_status_id: 1,prefecture_id: 1, category_id: 1,
  delivery_fee: 1,user_id: 1, sale_status_id: 1,delivery_method_id: 1 )
  end

end
