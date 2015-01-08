class WorkOrder < ActiveRecord::Base
  has_one  :user
  has_one  :customer
  has_many :customer_questions
  has_one  :phone_record
end
