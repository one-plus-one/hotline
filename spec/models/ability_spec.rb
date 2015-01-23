require 'rails_helper'

RSpec.describe Ability do |app|

  describe 'ability' do

    it 'should permit System user manage all' do
      user = FactoryGirl.create :user
      ability = Ability.new(user)
      puts user.id
    end
  end
end