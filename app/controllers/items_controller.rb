class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    2.times {@item.images.build}
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
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    # binding.pry
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
  params.require(:item).permit(
                          :name,
                          :price,
                          :description,
                          # :item_status_id,
                          :sale_status_id,
                          # :size_id,
                          # :brand_id, 
                          :delivery_status_id,
                          :prefecture_id,
                          :category_id,
                          :delivery_fee,
                          images_attributes: [:image]
  ).merge(user_id: 1, size_id: 1, brand_id: 1, item_status_id: 1, sale_status_id: 1,delivery_method_id: 1 )
end

def image_params
  params.require(:images).permit(:image)
end

end