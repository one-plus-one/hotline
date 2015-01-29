require 'rails_helper'

RSpec.describe User do
  subject(:work_order_book){Spreadsheet::Workbook.new}
  subject(:sheet1){work_order_book.create_worksheet}
  describe '.add_column_name' do

    it "shoud add  create user name to sheet1" do
      User.add_column_names(sheet1, 0, true)
      expect(sheet1[0, 0]).to eql('创建人姓名')
    end
    it "shoud add  update user name to sheet1" do
      User.add_column_names(sheet1, 0, false)
      expect(sheet1[0, 0]).to eql('修改人姓名')
    end
  end

  describe '.add_column_value' do
    it "should add user name to sheet" do
      user= User.create(username: 'admin', password: '123456', email: 'admin@example.com')
      User.add_column_value(sheet1,0,0,user.id)
      expect(sheet1[0,0]).to eql('admin')
    end
  end
end