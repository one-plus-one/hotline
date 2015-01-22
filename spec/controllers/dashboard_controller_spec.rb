require 'rails_helper'

RSpec.describe DashboardController do

  before do
    sign_in
  end

  describe 'dashboard' do

    it 'should render home page' do
      get :home
      expect(response).to be_success
    end

    it 'should response to oncall page with phone number' do
      get :oncall, :tel => '21310990'
      expect(assigns(:tel)).to eq('21310990')
    end
  end

  describe 'home page' do
    it 'response to oncall page with phone number' do
      get :oncall, :tel => '123'
      expect(assigns(:tel)).to eq('123')
    end

    it 'should redirect to new work order page with phone number' do
      get :answer, :tel => '21310990'
      expect(response).to redirect_to(new_work_order_path(:phone_num => '21310990'))
    end

  end
end
