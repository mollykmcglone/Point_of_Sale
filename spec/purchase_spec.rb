require("spec_helper")

describe(Purchase) do
  describe('#products') do
    it "tells which products are in purchase" do
      test_purchase = Purchase.create()
      test_product1 = Product.create({:name => "picture", :price => 20.00, :sold => false, :purchase_id => test_purchase.id})
      test_product2 = Product.create({:name => "chair", :price => 400.00, :sold => false, :purchase_id => test_purchase.id})
      expect(test_purchase.products).to eq([test_product1, test_product2])
    end
  end

  describe('.between') do
    it "returns all the purchases between start_date and end_date" do
      test_purchase1 = Purchase.create()
      test_purchase2 = Purchase.create()
      test_purchase3 = Purchase.create()
      expect(Purchase.between('2016-07-18', '2016-07-19')).to eq([test_purchase1, test_purchase2, test_purchase3])
    end
  end
end
