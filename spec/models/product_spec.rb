require 'rails_helper'
require 'products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create( :name => 'Alive')
      puts @category.inspect
      @product = Product.new(
        name: "Plant One",
        description: "It's green and alive.",
        image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
        price_cents: 111,
        quantity: 1111,
        category_id: @category.id
      )
    end


    describe "#product" do
      it "is valid with valid attributes" do
        expect( @product ).to be_valid
      end

      it "is not valid without a name" do
        @product.name = nil
        @product.save
        puts @product.errors.full_messages.inspect
        expect( @product ).to_not be_valid
        expect( @product.errors.full_messages ).to eq(["Name can't be blank"])
      end
  
      it "is not valid without a price" do
        @product.price_cents = nil
        @product.save
        puts @product.errors.full_messages.inspect
        expect( @product ).to_not be_valid
      end
    
      it "is not valid without a quantity" do
        @product.quantity = nil
        @product.save
        puts @product.errors.full_messages.inspect
        expect( @product ).to_not be_valid
      end
  
      it "is not valid without a category" do
        @product.category_id = nil
        @product.save
        puts @product.errors.full_messages.inspect
        expect( @product ).to_not be_valid
      end
    end

  end
end