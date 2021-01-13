require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
   
    it 'Should Fail On Save For Nil Name' do
      @category = Category.new(name: "Test")
      @category.save!
      @product = Product.new(name: nil, price: 1000, quantity: 30, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'Should Fail On Save For Nil price' do
      @category = Category.new(name: "Test")
      @category.save!
      @product = Product.new(name: nil, price: nil, quantity: 30, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'Should Fail On Save For Nil Quantity' do
      @category = Category.new(name: "Test")
      @category.save!
      @product = Product.new(name: nil, price: 1000, quantity: nil, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'Should Fail On Save For Nil Category' do
      @product = Product.new(name: nil, price: 1000, quantity: 30, category: nil)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'Should Fail On Save For Nil Name' do
      @category = Category.new(name: "Test")
      @category.save!
      @product = Product.new(name: nil, price: 1000, quantity: 30, category: @category)
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
