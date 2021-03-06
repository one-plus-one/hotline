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
          index_y=Customer.add_column_value(sheet1, index_x+1, index_y, work_order[column_name])
          index_y-=1
        elsif column_name=='status'
          sheet1[index_x+1, index_y]= work_order[column_name] ? '解决' : '未解决'
        elsif column_name=='phone_record_id'
          # sheet1[0, index]='工单编号'
        else
          sheet1[index_x+1, index_y]= work_order[column_name]
        end
        index_y+=1
      end
      CustomerQuestion.add_column_value(sheet1,index_x+1,index_y,work_order.id)
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
        index=Customer.add_column_names(sheet1, index)
        index-=1
      elsif column_name=='created_at'
        sheet1[0, index]='创建时间'
      elsif column_name=='updated_at'
        sheet1[0, index]='修改时间'
      elsif column_name=='status'
        sheet1[0, index]='状态'
      elsif column_name=='id'
        sheet1[0, index]='工单编号'
      elsif column_name=='phone_record_id'
        # sheet1[0, index]='工单编号'
      else
        sheet1[0, index]=column_name
      end
      index+=1
    end
    CustomerQuestion.add_column_names(sheet1,index)
  end
end
