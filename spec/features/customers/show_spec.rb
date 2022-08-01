require 'rails_helper'

RSpec.describe 'Customer Show Page' do 
  it "has a list of items and the associated supermarket" do 
    supermarket1 = Supermarket.create!(name: "Raileys", location: "Sparks")
    supermarket2 = Supermarket.create!(name: "WinCo", location: "Reno")

    customer1 = Customer.create!(name: "Shirley", supermarket_id: supermarket1.id)
    customer2 = Customer.create!(name: "Anthony", supermarket_id: supermarket2.id)

    item1 = Item.create!(name: "Bagels", price: 3)
    item2 = Item.create!(name: "Cream Cheese", price: 2)
    item3 = Item.create!(name: "Salmon", price: 5)
    item4 = Item.create!(name: "Capers", price: 4)
    item5 = Item.create!(name: "Red Onion", price: 1)

    customer_item1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customer_item2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customer_item3 = CustomerItem.create!(customer_id: customer1.id, item_id: item3.id)
    customer_item4 = CustomerItem.create!(customer_id: customer2.id, item_id: item4.id)
    customer_item5 = CustomerItem.create!(customer_id: customer2.id, item_id: item5.id)

    visit "/customers/#{customer1.id}"

    expect(page).to have_content("Raileys")
    expect(page).to_not have_content("Smiths")

    expect(page).to have_content("Bagels")
    expect(page).to have_content("Cream Cheese")
    expect(page).to have_content("Salmon")
    expect(page).to_not have_content("Capers")
  end 

  it "can show total price of all items" do 
    supermarket1 = Supermarket.create!(name: "Raileys", location: "Sparks")

    customer1 = Customer.create!(name: "Shirley", supermarket_id: supermarket1.id)

    item1 = Item.create!(name: "Bagels", price: 3)
    item2 = Item.create!(name: "Cream Cheese", price: 2)
    item3 = Item.create!(name: "Salmon", price: 5)

    customer_item1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customer_item2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customer_item3 = CustomerItem.create!(customer_id: customer1.id, item_id: item3.id)

    visit "/customers/#{customer1.id}"

    expect(page).to have_content("Total Price: $10")
  end 
end 