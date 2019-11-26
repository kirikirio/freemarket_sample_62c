class ItemsController < ApplicationController

  def index
  end

  def new
    
    @item = Item.new
    @parents = Category.roots
    @sizes = Size.all
    @brands = Brand.all
    @item_statuses = ItemStatus.all
    @prefectures = Prefecture.all
    @delivery_statuses = DeliveryStatus.all
    @delivery_method = DeliveryMethod.all
    @delivery_fee = ['着払い','送料込み']

    # js非同期処理
    if (params[:parentId])
      parent = Category.find(params[:parentId])
      @children = parent.children
    end
    respond_to do |format|
      format.html
      format.json { render json: @children}
    end
    # binding.pry
  end

  
  def edit
  end

  def show
  end

  def update
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    @parents = Category.roots
    @sizes = Size.all
    @brands = Brand.all
    @item_statuses = ItemStatus.all
    @prefectures = Prefecture.all
    @delivery_statuses = DeliveryStatus.all
    @delivery_method = DeliveryMethod.all
    @delivery_fee = ['着払い','送料込み']
    if @item.images == []
      flash.now[:alert] = '必須項目を入力してください。'
      render 'items/new' and return
    end
    # if @images.valid?(:save)
    #   binding.pry
    # end
    # @image = Image.new(image_params)
    # @image = Image.new(image: params[:images][:image],item_id: 1)
    if @item.save
      # params[:images][:image].each do |i|
      #   @item.images.new(image: i,item_id: @item.id)
      #   binding.pry
      # end
      # params[:]
      # && @image.save

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


# def item_params
#   # images_attributes: image: []
#   params.require(:item).permit(
#                           images_attributes: [:image]
#   ).merge(name: 'パーカー', price: 3000, description: '商品の説明',
#   item_status_id: 1,size_id: 1,brand_id:1,
#   delivery_status_id: 1,prefecture_id: 1, category_id: 1,user_id: 1,delivery_method_id: 1,delivery_fee: '送料込み' )
# end
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
                          images_attributes: [:image]
                        ).merge(
                          user_id: 1,
                          sale_status_id: 1,delivery_method_id: 1 
                        )
end
# params[:item][:images_attributes][:'0'][:image]
# def image_params
#   params.require(:images).permit(:image).merge(item_id: 1)
# end

end