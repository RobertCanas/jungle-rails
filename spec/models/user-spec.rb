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

  describe '.authenticate_with_credentials' do


    it 'should be valid if email and password are valid' do
     @user = User.new({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
     @user.save
      expect(@user.email).to eq('BillyBob@hotmail.com')
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'should be valid when credentials are valid' do
     @user = User.new({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
     @user.save
      expect(User.authenticate_with_credentials('BillyBob@hotmail.com', 'BillyBob123')).to eq(@user)
    end

    it 'should not be valid on wrong password credential' do
     @user = User.create({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
      expect(User.authenticate_with_credentials('BillyBob@hotmail.com', 'lolcats123')).to be_falsey
    end

    it 'should not be valid on wrong email credential' do
     @user = User.create({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
      expect(User.authenticate_with_credentials('FakeEmail@hotmail.com', 'BillyBob123')).to be_falsey
    end

    it 'should be valid when credentials are valid even if there is whitespace' do
     @user = User.create({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
      expect(User.authenticate_with_credentials('  Billybob@hotmail.com  ', 'BillyBob123')).to eq(@user)
    end

    it 'should be valid when credentials are valid even if it is capitalized' do
     @user = User.create({
        name: 'Billy',
        email: 'BillyBob@hotmail.com',
        password: 'BillyBob123',
        password_confirmation: 'BillyBob123'
      })
      expect(User.authenticate_with_credentials('BilLyBob@hotMail.com', 'BillyBob123')).to eq(@user)
    end

  end

end