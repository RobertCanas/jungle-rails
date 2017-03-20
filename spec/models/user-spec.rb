require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid when all fields are present' do
      @user = User.new({
        name: 'Bob',
        email: 'Bobby@wings.com',
        password: 'test123',
        password_confirmation: 'test123'
      })
      expect(@user).to be_valid
    end

    it 'should have matching password and password_confirmation' do
      @user = User.new({
        name: 'Bobby',
        email: 'Bobby123@wings.com',
        password: 'test123',
        password_confirmation: 'test1234'
      })
      @user.save
      expect(@user.password).to_not eql(@user.password_confirmation)
    end
  end
end