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
end