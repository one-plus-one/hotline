class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
    @catalog = Catalog.all
  end

  def create
    repository = Repository.new
    repository.title = params[:repository][:title]
    repository.answer = params[:repository][:answer]
    repository.catalog_id = params[:catalog]
    if repository.save!
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
end
