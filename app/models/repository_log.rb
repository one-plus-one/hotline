class RepositoryLog < ActiveRecord::Base
  def save(name,action,event)
    self.name = name
    self.action = action
    self.event = event
    self.save!
  end
end
