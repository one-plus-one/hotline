class Repository < ActiveRecord::Base
  belongs_to :catalog
  validates :title, :answer, presence:true
  validates :title, uniqueness: true
  def save_repository(params)
    self.title = params[:repository][:title]
    self.answer = params[:repository][:answer]
    self.catalog_id = params[:catalogs]
    self.save
  end
end
