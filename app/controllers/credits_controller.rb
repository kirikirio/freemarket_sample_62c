class CreditsController < ApplicationController

  def index
    Payjp.api_key = ENV['PAYJP_API_KEY']
    customer = Payjp::Customer.retrieve(current_user.customer_id)
    @card_information = customer.cards.retrieve(current_user.card_id)
  end

end
