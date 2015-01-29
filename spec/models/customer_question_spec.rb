require 'rails_helper'

RSpec.describe CustomerQuestion do
  subject(:work_order_book){Spreadsheet::Workbook.new}
  subject(:sheet1){work_order_book.create_worksheet}

  describe '.add_column_names' do
    it 'should do add question title and answer to table' do
      CustomerQuestion.add_column_names(sheet1,0)
      expect(sheet1[0,0]).to eql('问题')
    end
  end

  describe '.add_column_value' do
    it 'should do add data to export work_order table if the question_id is not nil' do
      user= User.create!(username: 'admin', password: '123456', email: 'admin@example.com')
      customer= Customer.create!(name: 'wubang', phone_num: '123')
      work_order = WorkOrder.create!(status: true, user_id: user.id, customer_id: customer.id, updated_user_id: user.id)
      CustomerQuestion.create!(title: 'title', answer: 'answer',work_order_id: work_order.id)
      CustomerQuestion.add_column_value(sheet1,0,0,work_order.id)
      expect(sheet1[0,0]).to eql('title')
    end

    it 'should do add nil to export work_order table if the question_id is nil' do
      user= User.create!(username: 'admin', password: '123456', email: 'admin@example.com')
      customer= Customer.create!(name: 'wubang', phone_num: '123')
      work_order = WorkOrder.create!(status: true, user_id: user.id, customer_id: customer.id, updated_user_id: user.id)
      CustomerQuestion.add_column_value(sheet1,0,0,work_order.id)
      expect(sheet1[0,0]).to eql(nil)
    end
  end
end
