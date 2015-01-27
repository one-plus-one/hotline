class RepositoriesController < ApplicationController
  before_action :new_a_repository, only: [:new,:create]
  def index
    @repositories = Repository.all
  end

  def new
    @catalogs = Catalog.all
  end

  def create
    @repository.save(params)
    if true
      redirect_to repositories_path
    else
      redirect_to new_repository_path
    end
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
