class ItemsController < ApplicationController

  def index
    @items = Item.order('id ASC').limit(10)
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
