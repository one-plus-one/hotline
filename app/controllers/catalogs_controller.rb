class CatalogsController < ApplicationController
  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new
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
end
