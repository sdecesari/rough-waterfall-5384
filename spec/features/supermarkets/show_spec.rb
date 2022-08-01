require 'rails_helper'

RSpec.describe "Supermarket Show Page" do 
  it "shows the name of the supermarket and a link to it's items" do 
    supermarket1 = Supermarket.create!(name: "Raileys", location: "Sparks")
    supermarket2 = Supermarket.create!(name: "WinCo", location: "Reno")

    visit "/supermarkets/#{supermarket1.id}"

    expect(page).to have_content("Raileys")
    expect(page).to_not have_content("WinCo")
    expect(page).to have_link("View All Items")
    
    click_link "View All Items"

    expect(current_path).to eq("/supermarkets/#{supermarket1.id}/items")
  end 
end 