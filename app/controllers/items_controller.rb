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
  end

  def edit
  end

  def show
  end

  def update
  end

  def create
  end

  def delete
  end

  def confirmation
  end

  def list
  end



end
