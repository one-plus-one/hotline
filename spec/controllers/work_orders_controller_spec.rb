require 'rails_helper'

RSpec.describe WorkOrdersController do
  before do
    sign_in
  end


  describe 'GET new' do
    it 'should initialize customer for an new work_order' do
      get :new
      expect(assigns(:work_order)).to be_a_new(WorkOrder)
    end
  end
end