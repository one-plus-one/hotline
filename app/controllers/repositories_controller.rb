class RepositoriesController < ApplicationController
  before_action :new_a_repository, only: [:new,:create]
  def index
    @repositories = Repository.page(params[:page]).per(2)
  end

  def new
    @catalogs = Catalog.all
  end

  def create
    @repository.save(params)
    redirect_to repositories_path
  end

  def show
    @repository = Repository.find(params[:id])
    @catalogs = Catalog.all
  end

  def update
    @repository = Repository.find(params[:id])
    @repository.save(params)
    redirect_to repositories_path
  end

  def destroy
    reposity = Repository.find(params[:id])
    reposity.destroy!
    redirect_to repositories_path
  end

  def new_a_repository
    @repository = Repository.new
  end
end
