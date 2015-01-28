class WorkOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :customer_questions
  belongs_to :phone_record
  accepts_nested_attributes_for :customer_questions

  def save_and_update(params, customer, user)
    #update
    if self.id==nil
      self.user_id=user.id
    end
    self.updated_user_id=user.id
    self.status = params[:status]
    self.customer_id = customer.id #获取到当前的customerID
    self.updated_at=Time.new
    self.save!
  end

  def self.to_xls
    work_order_book = Spreadsheet::Workbook.new
    sheet1 = work_order_book.create_worksheet
    create_table_header(sheet1)
    add_data_to_table(sheet1)
    work_order_book.write 'work_orders.xls'
  end

  def self.add_data_to_table(sheet1)
    all.each_with_index do |work_order, index_x|
      index_y=0
      column_names.each do |column_name|
        if column_name=='user_id'
          User.add_column_value(sheet1, index_x+1, index_y, work_order[column_name])
        elsif column_name=='updated_user_id'
          User.add_column_value(sheet1, index_x+1, index_y, work_order[column_name])
        elsif column_name=='customer_id'
          Customer.add_column_value(sheet1, index_x+1, index_y, work_order[column_name])
        else
          sheet1[index_x+1, index_y]= work_order[column_name]
        end
        index_y+=1
      end
    end
  end

  def self.create_table_header(sheet1)
    index=0
    column_names.each do |column_name|
      if column_name=='user_id'
        User.add_column_names(sheet1, index, true)
      elsif column_name=='updated_user_id'
        User.add_column_names(sheet1, index, false)
      elsif column_name=='customer_id'
        Customer.add_column_names(sheet1, index)
      else
        sheet1[0, index]=column_name
      end
      index+=1
    end
  end
end
