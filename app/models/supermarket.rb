class Supermarket < ApplicationRecord
  has_many :customers
  has_many :customer_items, through: :customers
  has_many :items, through: :customer_items

  def items_list
    items.joins(:customers).select('items.*, count(customers.id) as count').group("items.id").order(customer_count: :desc).limit(3)
  end
end