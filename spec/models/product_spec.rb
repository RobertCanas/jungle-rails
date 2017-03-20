require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:all) do
      @category = Category.find_or_create_by! name: "test"
    end

    it 'should be valid when all fields are present' do
      @product = Product.new({
        category: @category,
        name: 'Basketball',
        quantity: 50,
        price: 49.99
      })
      expect(@product).to be_valid
    end

    it 'should not be valid when name is nil' do
      @product = Product.new({
        category: @category,
        name: nil,
        quantity: 75,
        price: 39.50
      })
      expect(@product).to_not be_valid
    end

    it 'should not be valid when quantity is nil' do
      @product = Product.new({
        category: @category,
        name: 'Soccer Ball',
        quantity: nil,
        price: 60.99
      })
      expect(@product).to_not be_valid
    end

    it 'should not be valid when price is nil' do
      @product = Product.new({
        category: @category,
        name: 'Beach Ball',
        quantity: 80,
        price: nil
      })
      expect(@product).to_not be_valid
    end

    it 'should not be valid when category is nil' do
      @product = Product.new({
        category: nil,
        name: 'Football',
        quantity: 80,
        price: 32.99
      })
      expect(@product).to_not be_valid
    end

  end
end