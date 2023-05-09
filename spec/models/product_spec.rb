require 'rails_helper'
require 'products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do


    before do
      @product = Product.new(
        :name => "Plant One",
        :description => "It's green and alive.",
        :image => "https://www.houseplantsexpert.com/wp-content/uploads/2022/09/syngonium_podophyllum.jpg",
        :price_cents => 99,
        :quantity => 1234
      )
      # puts @product.inspect
    end
    # validation tests/examples here
    describe "#add" do
      it "works!" do
        expect(1 + 1).to eql(2)
      end
    end

    describe "#name is present" do
      it "checks for name" do
        expect( @product.name ).to eq("Plant One")
      end
    end

  end
end