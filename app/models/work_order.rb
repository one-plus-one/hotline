class WorkOrder < ActiveRecord::Base
  has_one  :user
  has_one  :customer
  has_many :customer_questions
  has_one  :phone_record

  def save(params,customer, user)
    self.status = params[:status]
    self.customer_id = customer.id    #获取到当前的customerID
    self.users_id = user.id  #获取到当前的userID
    self.save!
  end
end
