class CustomerQuestion < ActiveRecord::Base
  belongs_to :work_order
  def save(params,workorder)
    self.title = params[:title]
    self.answer = params[:answer]
    self.note = params[:note]
    self.work_order_id = workorder.id
    self.save!
  end
end
