require('spec_helper')
require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('root path', :type => :feature) do
  it "takes us to the home page" do
    visit '/'
    expect(page).to have_content('manager')
  end
  it "takes us to the product form" do
    visit '/product/new'
    expect(page).to have_content('Name:')
  end
end

describe('purchase path', :type => :feature) do
  it "purchase an item" do
    product = Product.create({:name => "hi", :price => 20.00, :sold => false})
    visit '/purchases/new'
    check 'product_ids[]'
    click_button 'Checkout'
    expect(page).to have_content('hi')
  end

  it "shows total sales between range of dates" do
    purchase = Purchase.create()
    Product.create({:name => "hqi", :price => 20.00, :sold => true, :purchase_id => purchase.id})
    visit '/purchases'
    fill_in 'start_date', :with => '2016-07-01'
    fill_in 'end_date', :with => '2016-07-31'
    click_button 'Submit'
    expect(page).to have_content('$20')
  end
end
