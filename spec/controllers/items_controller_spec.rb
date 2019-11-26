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
end
