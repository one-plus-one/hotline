require 'rails_helper'

RSpec.describe UsersController do
  before do
    sign_in
  end

  describe 'Get index' do
    it 'should list all the users' do
      get :index
      expect(assigns[:users]).not_to eq(nil)
    end
  end

  describe 'Get new' do
    it "should return a new user" do
      get :new
      expect(assigns[:user]).to be_a_new(User)
    end
  end

  describe "Get show" do


    it "should prepare a user for page" do
      test_user = FactoryGirl.create :user, :username => "tester"
      get :show, :id => test_user.id
      expect(assigns[:user].username).to eq("tester")
    end
  end
end