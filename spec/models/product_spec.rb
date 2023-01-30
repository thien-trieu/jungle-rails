require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should create a product if all of the validations are true' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Supreme Nas Tee", price_cents: 3500, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
      end

    it "Error for product instance if the 'name' is missing" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: nil, price: "123", quantity: "5", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can\'t be blank")
    end

    it "Error for product instance if the 'price' is missing" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Supreme Nas Tee", quantity: 35, :category => @category)
      @product.save
      expect(@product.errors[:price]).to include("can\'t be blank")
      end

    it "Error for product instance if the 'quantity' is missing" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can\'t be blank")
    end

    it "Error for product instance if the 'category' is missing" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: "5", category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can\'t be blank")
    end

    it "expect product.errors.full_messages to be []" do
      @category = Category.new(name: "test")
      @product = Product.new(name: "product_test", price: nil, quantity: "5", category: @category)
      @product.save
 
      expect(@product.errors.full_messages).to eq([])
    end
  end
end