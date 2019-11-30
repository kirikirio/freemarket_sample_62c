require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #index' do
    it "@ladiesの中身が期待する値である" do
      get :index
      expect(assigns(:ladies).length).to eq 10
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe ItemsController do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      brand = FactoryBot.create(:brand)
      size= FactoryBot.create(:size)
      item_status= FactoryBot.create(:item_status)
      sale_status= FactoryBot.create(:sale_status)
      delivery_status= FactoryBot.create(:delivery_status)
      item = FactoryBot.create(:item)
      
      get :show, params: { id:item }
      expect(response).to render_template "items/show"
    end
  end

  describe 'GET #confirmation' do
    it "If you are not signed in, will you go to the login page?" do
      user = FactoryBot.create(:user)
      brand = FactoryBot.create(:brand)
      size= FactoryBot.create(:size)
      item_status= FactoryBot.create(:item_status)
      sale_status= FactoryBot.create(:sale_status)
      delivery_status= FactoryBot.create(:delivery_status)
      item = FactoryBot.create(:item)

      get :confirmation, params: { id: item.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
