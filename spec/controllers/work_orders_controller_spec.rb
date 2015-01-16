require 'rails_helper'

RSpec.describe WorkOrdersController do
  before do
    sign_in
  end

  describe 'GET index' do
    it "should get all workorders for current user" do
      get :index
      expect(assigns(:work_orders)).not_to eql(nil)
    end
  end

  describe 'GET new' do
    it "should initlizale a new workorder" do
      get :new
      expect(assigns[:work_order].id).to eql(nil)
    end
  end

  describe 'POST create' do
    it "should save workorder and redirect to dashboard home path" do
      #post :create
      # expect(response).to redirect_to(dashboard_home_path)
    end
  end

  describe 'PUT update' do
    it "should save workorder and redirect to workorders index path" do
      # post :update
      # expect(response).to redirect_to(work_orders_path)
    end
  end
end