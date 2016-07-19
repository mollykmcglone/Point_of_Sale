ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("pry")
require("sinatra/activerecord")
require("product")
require("purchase")

RSpec.configure do |config|
  config.after(:each) do
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
    Product.all().each() do |product|
      product.destroy()
    end
  end
end
