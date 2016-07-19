require("spec_helper")

describe(Product) do

  it("validates presence of name, price, and sold status") do
    product = Product.new({:name => ""})
    expect(product.save()).to(eq(false))
  end

  it("validates presence of name, price, and sold status") do
    product = Product.new({:name => "hi", :price => 20.00, :sold => false})
    expect(product.save()).to(eq(true))
  end

  it("returns the not done products") do
    not_sold_product1 = Product.create({:name => "picture", :price => 20.00, :sold => false})
    not_sold_product2 = Product.create({:name => "chair", :price => 400.00, :sold => false})
    not_sold_products = [not_sold_product1, not_sold_product2]
    sold_product = Product.create({:name => "sofa", :price => 100.00, :sold => true})
    expect(Product.not_sold()).to(eq(not_sold_products))
  end

  it "tells which purchase it belongs to" do
    test_purchase = Purchase.create
    test_product = Product.create({name: 'hi', price: 40.00, sold: false, purchase_id: test_purchase.id})
    expect(test_product.purchase).to eq(test_purchase)
  end
end
