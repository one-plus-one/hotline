class Repository < ActiveRecord::Base
  belongs_to :catalog
  def save(params)
    self.title = params[:repository][:title]
    self.answer = params[:repository][:answer]
    self.catalog_id = params[:catalog]
    self.save!
  end
end