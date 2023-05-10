require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @user = User.new(
        email: "abc@def.ghi",
        firstname: "Alphabet",
        lastname: "Jones",
        password: "abcdefg",
        password_confirmation: "abcdefg"
      )
    end


    describe "#user" do
      it "is valid with valid attributes" do
        expect( @user ).to be_valid
      end

      # to be converted:

      # it "is not valid without a name" do
      #   @product.name = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Name can't be blank"])
      # end
  
      # it "is not valid without a price" do
      #   @product.price_cents = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
      # end
    
      # it "is not valid without a quantity" do
      #   @product.quantity = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Quantity can't be blank"])
      # end
  
      # it "is not valid without a category" do
      #   @product.category_id = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Category must exist", "Category can't be blank"])
      # end
    end

  end
end