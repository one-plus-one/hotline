require 'rails_helper'

RSpec.describe WorkOrdersController do

  before do
    sign_in
  end

  describe 'GET index' do
    work_order_one = FactoryGirl.create :work_order
    work_order_two = FactoryGirl.create :work_order, :status => "false"
    it "should get all workorders for current user" do
      get :index
      expect(assigns(:work_orders)).not_to eql(nil)
    end

    it "should get correct workorders for solved condition" do
      get :index, :commit => "已解决"
      expect(assigns(:work_orders).size).to be > 0
    end

    it "should get correct workorders for unsolved condition" do
      get :index, :commit => "未解决"
      expect(assigns(:work_orders).size).to be > 0
    end

    it "should get correct workorders for oneweek condition" do
      get :index, :commit => "一周"
      expect(assigns(:work_orders).size).to be > 0
    end

    it "should get correct workorders for onemonth condition" do
      get :index, :commit => "一月"
      expect(assigns(:work_orders).size).to be > 0
    end

    it "should get correct workorders for latest condition" do
      get :index, :commit => "三天"
      expect(assigns(:work_orders).size).to be > 0
    end

  end

  describe 'GET new' do

    it "should initialize a new workorder for a new customer" do
      get :new, :phone_num => "123"
      workorder = assigns[:work_order]
      expect(workorder).to be_a_new(WorkOrder)
      expect(workorder.customer_questions.first).to be_a_new(CustomerQuestion)
      expect(workorder.customer).to be_a_new(Customer)
    end

    it "should initialize workorder for an existing customer" do
      customer = FactoryGirl.create :customer
      work_order = FactoryGirl.create :work_order, :customer_id => customer.id
      FactoryGirl.create :customer_question, :work_order_id => work_order.id
      get :new, :phone_num => "1234"
      expect(assigns[:work_order].customer.phone_num).to eq("1234")
      expect(assigns[:work_order].customer.id).to eq(customer.id)
      expect(assigns[:arrays].first.title).to eq("question title")
    end
  end

  describe 'Get edit' do
    it 'should prepare the work order' do
      work_order = FactoryGirl.create :work_order
      FactoryGirl.create :customer_question, :work_order_id => work_order.id
      get :edit, :id => work_order.id
      expect(assigns[:work_order].id).to eq(work_order.id)
      expect(assigns[:work_order].customer_questions.first.title).to eq("question title")
    end

  end

  describe 'POST create' do
    it "should save workorder and redirect to dashboard home path" do
      post :create, :work_order => {
                      :status => "未解决",
                      :customer => {:name => "Mr.li", :age => "18", :phone_num => "1234", :disability_degree => "low"},
                      :customer_questions_attributes => {
                          0 => {:title => "the title", :answer => "the answer"},
                      }
                  }
      expect(response).to redirect_to(dashboard_home_path)
    end
  end

  describe 'PUT update' do
    it "should save workorder and redirect to workorders index path" do
      work_order = FactoryGirl.create :work_order
      put :update, {:id => work_order.id,:work_order => {
                      :status => "未解决",
                      :customer => {:name => "Mr.li", :age => "18", :phone_num => "1234", :disability_degree => "low"},
                      :customer_questions_attributes => {
                          0 => {:title => "the title", :answer => "the answer"},
                      }
                  }}
      expect(response).to redirect_to(work_orders_path)
    end
    end
  end