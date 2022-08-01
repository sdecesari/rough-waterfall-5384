require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  describe "class methods" do 
    it "#total_price" do 
      supermarket1 = Supermarket.create!(name: "Raileys", location: "Sparks")

    customer1 = Customer.create!(name: "Shirley", supermarket_id: supermarket1.id)

    item1 = Item.create!(name: "Bagels", price: 3)
    item2 = Item.create!(name: "Cream Cheese", price: 2)
    item3 = Item.create!(name: "Salmon", price: 5)

    customer_item1 = CustomerItem.create!(customer_id: customer1.id, item_id: item1.id)
    customer_item2 = CustomerItem.create!(customer_id: customer1.id, item_id: item2.id)
    customer_item3 = CustomerItem.create!(customer_id: customer1.id, item_id: item3.id)

    expect(customer1.total_price).to eq(10)
    end 
  end
end