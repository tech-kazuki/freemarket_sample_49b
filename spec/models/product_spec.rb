require 'rails_helper'

describe Product do
  describe "#create" do
    it "is invalid with a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    
  end
end

