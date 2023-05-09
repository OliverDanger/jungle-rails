require 'rails_helper'
require 'products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    describe "#add" do
      it "works!" do
        expect(1 + 1).to eql(2)
      end
    end

    before do
      @category = Category.create( :name => 'Alive', id: 1 )
    end

    describe "#product" do
      it "is valid with valid attributes" do
        puts @category.inspect
        product = Product.new(
          name: "Plant One",
          description: "It's green and alive.",
          image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
          price_cents: 111,
          quantity: 1111,
          category_id: @category.id
        )
        expect( product ).to be_valid
      end

      it "is not valid without a name" do
        product = Product.new(
          name: nil,
          description: "It's green and alive.",
          image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
          price_cents: 111,
          quantity: 1111,
          category_id: @category.id
        )
        expect( product ).to_not be_valid
      end
  
      it "is not valid without a price" do
        product = Product.new(
          name: "Plant One",
          description: "It's green and alive.",
          image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
          price_cents: nil,
          quantity: 1111,
          category_id: @category.id
        )
        expect( product ).to_not be_valid
      end
    
      it "is not valid without a quantity" do
        product = Product.new(
          name: "Plant One",
          description: "It's green and alive.",
          image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
          price_cents: 111,
          quantity: nil,
          category_id: @category.id
        )
        expect( product ).to_not be_valid
      end
  
      it "is not valid without a category" do
        product = Product.new(
          name: "Plant One",
          description: "It's green and alive.",
          image: "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
          price_cents: 111,
          quantity: 1111,
          category_id: nil
        )
        expect( product ).to_not be_valid
      end
    end

  end
end