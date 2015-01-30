class CatalogsController < ApplicationController
  before_action :new_catalog, :only => [:new, :create]
  def new
  end

  def create
    @catalog.name = params[:catalog][:name]
    if @catalog.save
      redirect_to repositories_path
    else
      render :new
    end
  end


  def index
    @catalogs = Catalog.all
  end

  def destroy
    catalog = Catalog.find(params[:id])
    catalog.destroy
    redirect_to catalogs_path
  end

  private
  def new_catalog
    @catalog = Catalog.new
  end

end
