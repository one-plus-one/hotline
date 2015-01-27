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
    column_names.each_with_index do |column_name, index|
      sheet1[0, index]= column_name
    end
    all.each_with_index do |work_order, index|
      column_names.each_with_index do |column_name, index_y|
        sheet1[index+1, index_y]= work_order[column_name]
      end
    end
    work_order_book.write 'work_orders.xls'
  end
end
