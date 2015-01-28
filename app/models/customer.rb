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

  def self.add_column_names(sheet1, index)
    sheet1[0,index]='客户姓名'
    sheet1[0,index+1]='客户年龄'
    sheet1[0,index+2]='客户性别'
    sheet1[0,index+3]='客户电话'
    sheet1[0,index+4]='残障程度'
    sheet1[0,index+5]='学历'
    sheet1[0,index+6]='地址'
    sheet1[0,index+7]='婚姻状况'
    sheet1[0,index+8]='地址'
    sheet1[0,index+9]='户口类型'
    sheet1[0,index+10]='了解渠道'
    index+=10
    # column_names.each do |column_name|
    #   sheet1[0,index]=column_name
    #   index+=1
    # end
  end
  def self.add_column_value(sheet1,index_x,index_y, id)
    customer = Customer.find(id)
    sheet1[index_x,index_y]=customer['name']
    sheet1[index_x,index_y+1]=customer['age']
    sheet1[index_x,index_y+2]=customer['gender']
    sheet1[index_x,index_y+3]=customer['phone_num']
    sheet1[index_x,index_y+4]=customer['disability_degree']
    sheet1[index_x,index_y+5]=customer['education']
    sheet1[index_x,index_y+6]=customer['occupation']
    sheet1[index_x,index_y+7]=customer['marital_status'] ? '已婚' : '未婚'
    sheet1[index_x,index_y+8]=customer['address']
    sheet1[index_x,index_y+9]=customer['address_type']
    sheet1[index_x,index_y+10]=customer['channel']
    index_y+=10
    # column_names.each do |column_name|
    #   sheet1[index_x,index_y]=customer[column_name]
    #   index_y+=1
    # end
  end
end
