class ItemsController < ApplicationController

  before_action :set_submodel, only: [:new, :create]
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :correct_user, only: [:show]
  
  def index
    @ladies_ids = Category.find(1).subtree_ids
    @ladies = Item.limit(10).where(category_id: @ladies_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @man_ids = Category.find(200).subtree_ids
    @men = Item.limit(10).where(category_id: @man_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @home_ids = Category.find(898).subtree_ids
    @homes = Item.limit(10).where(category_id: @home_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @toy_ids = Category.find(685).subtree_ids
    @toys = Item.limit(10).where(category_id: @toy_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @chanel_ids = Brand.find(1)
    @chanels = Item.limit(10).where(brand_id: @chanel_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @lv_ids = Brand.find(2)
    @lvs = Item.limit(10).where(brand_id: @lv_ids).where.not(user_id: current_user.id).order("created_at DESC")

    @supreme_ids = Brand.find(3)
    @supremes = Item.limit(10).where(brand_id: @supreme_ids).where.not(user_id: current_user.id).order("created_at DESC")
    
    @nike_ids = Brand.find(4)
    @nikes = Item.limit(10).where(brand_id: @nike_ids).where.not(user_id: current_user.id).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
    # 10.times{@item.images.build}
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
    if @item.images.blank?
      @item.images.build
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
    if user_signed_in?
      Payjp.api_key = ENV['PAYJP_API_KEY']
      @item = Item.find(params[:id])
      customer = Payjp::Customer.retrieve(current_user.customer_id)
      @card_information = customer.cards.retrieve(current_user.card_id)
    else
      redirect_to new_user_session_path
    end
  end

  def buy

    if current_user.customer_id.blank?
      flash[:credit] = "クレジットカードが登録されていません"
      redirect_to action: :confirmation
    else
      Payjp.api_key = ENV['PAYJP_API_KEY']
      @item = Item.find(params[:id])

      if @item.price.blank? || current_user.customer_id.blank?
        flash[:buy] = "購入に失敗しました"
        redirect_to action: :confirmation
      else
        Payjp::Charge.create(
          amount: @item.price, #支払金額
          customer: current_user.customer_id, #顧客ID
          currency: 'jpy', #日本円
        )
        @item.update(sale_status_id: 2)
        redirect_to buy_completed_item_path
      end
    end
  end

  def buy_completed
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
                            user_id: current_user.id
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

  def move_to_sign_in
    redirect_to controller: 'devise/sessions', action: 'new' unless user_signed_in?
  end

  def correct_user
    @item_current = current_user.items.find_by(id: params[:id])
    if @item_current
      redirect_to root_url
    end
  end

end
