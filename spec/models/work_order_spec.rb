require 'rails_helper'

RSpec.describe WorkOrder do

  describe 'workorder' do

    it 'should permit System user manage all' do
      workorder=FactoryGirl.create :work_order
      expect(workorder.user_id).to eql(workorder.updated_user_id)
    end

    it 'should permit admin user read all' do
      workorder=FactoryGirl.create :work_order
      workorder.updated_user_id=2
      expect(workorder.user_id).not_to eql(workorder.updated_user_id)
    end
  end

  describe '.create_table_header' do
    subject(:work_order_book) { Spreadsheet::Workbook.new }
    subject(:sheet1) { work_order_book.create_worksheet }
    it "should add finish the table header" do
      WorkOrder.create_table_header(sheet1)
      expect(sheet1[0,0]).to eql('工单编号')
    end
  end

  describe '.add_data_to_table' do
    subject(:work_order_book) { Spreadsheet::Workbook.new }
    subject(:sheet1) { work_order_book.create_worksheet }
    it 'should add the data to table' do
      user= User.create!(username: 'admin', password: '123456', email: 'admin@example.com')
      customer= Customer.create!(name: 'wubang', phone_num: '123')

      work_order = WorkOrder.create!(status: true, user_id: user.id, customer_id: customer.id, updated_user_id: user.id)
      CustomerQuestion.create!(title: 'nihao', work_order_id: work_order.id)
      WorkOrder.add_data_to_table(sheet1)
      expect(sheet1[1,0]).to eql(work_order.id)
    end
  end
end