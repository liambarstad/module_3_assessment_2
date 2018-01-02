require 'rails_helper'

RSpec.feature "user searches stores" do
  it "from search bar" do
    visit "/"
    fill_in "search", with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_css(".store", count: 10)
    expect(page).to have_css(".name", count: 10)
    expect(page).to have_css(".distance", count: 10)
    expect(page).to have_css(".phone_number", count: 10)
    expect(page).to have_css(".type", count: 10)

    click_on "2"

    expect(page).to have_css(".store", count: 7)
  end
end
