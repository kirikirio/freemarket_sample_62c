class CreditsController < ApplicationController

  require "payjp"
  before_action :entry_card

  def index

  end
  
  def show
  end

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?    # カードがなかったらcreateに飛ぶ
  end
  
  def create
    Payjp.api_key = 'sk_test_04387e0973780d6cbbb78c9e' #pay.jpの秘密キー

    if params['payjp-token'].blank?
        redirect_to action: "new"
        customer = Payjp::Customer.create(description: 'test')  #顧客作成
        customer.cards.create(card: params[:payjp_token])       #上の顧客のカード作成

  end



  def entry_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
