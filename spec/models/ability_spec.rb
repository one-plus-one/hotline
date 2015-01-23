require 'rails_helper'

RSpec.describe Ability do

  describe 'ability' do

    it 'should permit System user manage all' do
      user = FactoryGirl.create :user
      user.add_role 'system'
      ability = Ability.new(user)
      expect(ability.can? :manager, :all).to eql(true)
      end
    it 'should permit admin user read all' do
      user = FactoryGirl.create :user
      user.add_role 'admin'
      ability = Ability.new(user)
      expect(ability.can? :manager, :all).to eql(false)
      expect(ability.can? :read, :all).to eql(true)
    end

    it 'should permit admin user read all' do
      user = FactoryGirl.create :user
      user.add_role 'guest'
      ability = Ability.new(user)
      expect(ability.can? :manager, :all).to eql(false)
      expect(ability.can? :read, :all).to eql(false)
      expect(ability.can? :read, :work_orders).to eql(true)
    end
  end
end