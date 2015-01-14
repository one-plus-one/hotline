class CustomerQuestion < ActiveRecord::Base
  belongs_to :work_order
  def save(params,work_order_id)
    self.title = params[:title]
    self.answer = params[:answer]
    self.note = params[:note]
    self.work_order_id = work_order_id
    self.save!
  end
end
