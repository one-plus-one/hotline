require 'rails_helper'

RSpec.describe DashboardController do

  before do
    sign_in
  end

  describe 'home page' do
    it 'response to oncall page with phone number' do
      get :oncall, :tel => '123'
      expect(assigns(:tel)).to eq('1234')
    end
  end
end