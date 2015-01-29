require 'rails_helper'

RSpec.describe RepositoriesController do

  before do
    sign_in
  end

    describe 'get index page' do
      it 'should list all repositories' do
        catalog = FactoryGirl.create :catalog, :name => '看电视'
        repository_one = FactoryGirl.create :repository, :catalog_id => catalog.id
        repository_one = FactoryGirl.create :repository, :catalog_id => catalog.id, :title => "哪家医院好啊", :answer => "协和医院啊"
        get :index
        expect(assigns[:repositories].size).to eql(2)
      end
    end

    describe 'get new' do
      it "should return a new repository" do
        get :new
        expect(assigns[:repository]).to be_a_new(Repository)
      end
    end

    describe 'create a new ' do
      it "should create a new repository" do
        catalog = FactoryGirl.create :catalog, :name => '残障'
        post :create, {"catalog"=> catalog.id , "repository"=>{"title"=>"哪个地方图书多啊", "answer"=>"看看"}}
        expect(response).to redirect_to(repositories_path)
        expect(assigns[:repository_log].action).to eql("增加")
      end
    end

    describe 'delete one' do
      it "should delete a useless repository" do
        # catalog = FactoryGirl.create :catalog, :name => '其他'
        # repository= FactoryGirl.create :repository, :catalog_id => catalog.id, :title => "清华大学"
        # delete :destroy, { 'id' => repository.id}
        # expect(response).to redirect_to(repositories_path)
        # expect(assigns[:repository_log].action).to eql("删除")
      end
    end

end