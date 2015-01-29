require 'rails_helper'

RSpec.describe CatalogsController do
  describe 'get index page' do

    it 'should list all catalogs' do
      catalog = FactoryGirl.create :catalog, :name => '教育'
      get :index
      expect(assigns[:catalogs].size).not_to eql(nil)
    end
  end

end