class WorkOrder < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :customer
  has_many :customer_questions
  belongs_to  :phone_record
  accepts_nested_attributes_for :customer_questions

  def save_and_update(params,customer, user)
    #update
    if self.id==nil
      self.user_id=user.id
    end
    self.updated_user_id=user.id
    self.status = params[:status]
    self.customer_id = customer.id    #获取到当前的customerID
    self.updated_at=Time.new
    self.save!
  end
end
