require 'rails_helper'

RSpec.describe RepositoriesController do

    describe 'get index page' do
      before do
        catalog = FactoryGirl.create :catalog
        repository_one = FactoryGirl.create :repository, :catalog_id => catalog.id
        repository_one = FactoryGirl.create :repository, :catalog_id => catalog.id, :title => "哪家医院好啊", :answer => "协和医院啊"
      end

      it 'should list all repositories' do
          get :index
          expect(assigns[:repositories].size).to eql(2)
      end
    end

    describe 'get new' do
      it "should return a new repository" do
        get :new
        expect(assigns[:repository]).to be_a_new(Repository)
      end

      it "should list all catalogs" do
        catalog_one = FactoryGirl.create :catalog
        catalog_two = FactoryGirl.create :catalog, :name => "卫生"
        get :new
        expect(assigns[:catalogs].size).to eql(2)
      end
    end

    describe 'create a new ' do
      it "should create a new repository" do
        catalog = FactoryGirl.create :catalog
        post :create, {"catalog"=> catalog.id , "repository"=>{"title"=>"哪个地方图书多啊", "answer"=>"看看"}}
        expect(response).to redirect_to(repositories_path)
      end
    end

    describe 'delete one' do
      it "should delete a useless repository" do
        catalog = FactoryGirl.create :catalog
        repository = FactoryGirl.create :repository, :catalog_id => catalog.id
          delete :destroy, {"id"=> repository.id}
        expect(response).to redirect_to(repositories_path)
      end
    end

end