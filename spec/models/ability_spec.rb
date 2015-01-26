require 'rails_helper'

RSpec.describe Ability do

  describe 'ability' do
    subject(:user){FactoryGirl.create :user}
    subject(:ability){Ability.new(user)}

    it 'should permit System user manage all' do
      user.add_role 'system'
      expect(ability.can? :manager, :all).to eql(true)
      end
    it 'should permit admin user read all' do
      user.add_role 'admin'
      expect(ability.can? :manager, :all).to eql(false)
      expect(ability.can? :read, :all).to eql(true)
    end

    it 'should permit admin user read all' do
      user.add_role 'guest'
      expect(ability.can? :manager, :all).to eql(false)
      expect(ability.can? :read, :all).to eql(false)
      expect(ability.can? :read, :work_orders).to eql(true)
    end
  end
end