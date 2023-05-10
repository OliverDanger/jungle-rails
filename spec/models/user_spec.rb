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

      it "is not valid if password is different than password_confirmation" do
        @user.password = "zyxwvut"
        expect( @user ).to_not be_valid
      end

      it "is not valid without an email" do
        @user.email = nil
        @user.save
        expect( @user ).to_not be_valid
        expect( @user.errors.full_messages ).to eq(["Email can't be blank"])
      end

      it "is not valid without a first name" do
        @user.firstname = nil
        @user.save
        expect( @user ).to_not be_valid
        expect( @user.errors.full_messages ).to eq(["Firstname can't be blank"])
      end

      it "is not valid without a last name" do
        @user.lastname = nil
        @user.save
        expect( @user ).to_not be_valid
        expect( @user.errors.full_messages ).to eq(["Lastname can't be blank"])
      end

      it "is not valid if email already belongs to another user" do 
        @user2 = User.new(
          email: "ABC@def.ghi",
          firstname: "Alphabet",
          lastname: "Imposter",
          password: "abcdefg",
          password_confirmation: "abcdefg"
        )
        @user.save
        @user2.save
        expect( @user2 ).to_not be_valid
        expect( @user2.errors.full_messages ).to eq(["Email has already been taken"])
      end

      it "is not valid if password length is less than six" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.save
        expect( @user ).to_not be_valid
        expect( @user.errors.full_messages ).to eq(["Password is too short (minimum is 7 characters)"])
      end

      # examples:

      # it "is not valid without a name" do
      #   @product.name = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Name can't be blank"])
      # end
  
      # it "is not valid without a category" do
      #   @product.category_id = nil
      #   @product.save
      #   puts @product.errors.full_messages.inspect
      #   expect( @product ).to_not be_valid
      #   expect( @product.errors.full_messages ).to eq(["Category must exist", "Category can't be blank"])
      # end
    end

    describe '.authenticate_with_credentials' do
      it "returns the user if email and password match" do 
        @user.save
        expect( User.authenticate_with_credentials(@user.email, @user.password) ).to eq(@user)
      end
      it "returns nil if email and password don't match" do 
        @user.save
        false_password = "qwerty"
        expect( User.authenticate_with_credentials(@user.email, false_password) ).to eq(nil)
      end
    end

  end
end