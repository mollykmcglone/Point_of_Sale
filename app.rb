require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/') do
  erb(:index)
end

get ('/pos') do
  erb(:pos)
end

get ('/manager') do
  erb(:pos)
end

get ('/cashier') do
  erb(:pos)
end

get ('/products') do
  @products = Product.not_sold()
  erb(:products)
end

post ('/products') do
  name = params.fetch('name')
  price = params.fetch('price').to_f
  @product = Product.create({:name => name, :price => price, :sold => false})
  @products = Product.not_sold()
  erb(:products)
end

get ('/product/new') do
  erb(:product_form)
end

get ('/product/:id') do
  @product = Product.find(params.fetch('id').to_i())
  erb(:product)
end

patch ('/product/:id') do
  name = params.fetch('name')
  price = params.fetch('price')
  @product = Product.find(params.fetch('id').to_i())
  @product.update({:name => name, :price => price})
  erb(:product)
end

delete ('/products') do
  @product = Product.find(params.fetch('id').to_i())
  @product.delete()
  @products = Product.not_sold()
  erb(:products)
end

get ('/purchases/new') do
  @products = Product.not_sold()
  erb(:purchase)
end

post ('/receipt') do
  purchase = Purchase.create()
  product_ids = params['product_ids']
  @products = []
  @total = 0
  product_ids.each do |product_id|
    product = Product.find(product_id)
    product.update({purchase_id: purchase.id, sold: true})
    @products.push(product)
    @total += product.price
  end
  erb(:receipt)
end

get ('/purchases') do
  erb(:purchases_form)
end

post ('/purchases') do
  @start = params['start_date']
  @end = params['end_date']
  @total = 0
  Purchase.between(@start, @end).each do |purchase|
    Product.where(purchase_id: purchase.id).each do |product|
      @total += product.price
    end
  end
  erb(:purchases)
end
