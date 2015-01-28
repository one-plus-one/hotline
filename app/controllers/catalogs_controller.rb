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
end
