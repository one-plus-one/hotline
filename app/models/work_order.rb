class WorkOrder < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :customer
  has_many :customer_questions
  belongs_to  :phone_record
  accepts_nested_attributes_for :customer_questions

  def save(params,customer, user)
    self.status = params[:status]
    self.customer_id = customer.id    #获取到当前的customerID
    self.user_id = user.id  #获取到当前的userID
    self.save!
  end
end
