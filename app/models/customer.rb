class Customer < ActiveRecord::Base
  has_one :work_order

  def save(params)

    self.name = params[:name]
    self.age = params[:age]
    self.gender = params[:gender]
    self.phone_num = params[:phone_num]
    self.disability_degree = params[:disability_degree]
    self.education = params[:education]
    self.occupation = params[:occupation]
    self.marital_status = params[:marital_status]
    self.address = params[:address]
    self.address_type = params[:address_type]
    self.channel = params[:channel]
    self.phone_num = params[:phone_num]
    self.save!
  end
end
