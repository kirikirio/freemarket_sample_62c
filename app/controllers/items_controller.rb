class ItemsController < ApplicationController
  before_action :set_submodel, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new

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
  end

  def show
  end

  def update
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
                            images_attributes: [:image]
                          ).merge(
                            user_id: 1,
                            sale_status_id: 1,
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
  end


end