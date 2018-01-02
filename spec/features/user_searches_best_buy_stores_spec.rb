#And I should see pagination links below the search results for the number of pages (2 in this case)
#And `1` is my current page but isn't a clickable link
#And `2` is a clickable link
#When I click `2`
#Then I should be taken to the next page of search results
#Then my current path should be "/search" (ignoring params)
#And in the params I should see `page=2`
#And I should see stores within 25 miles
#And I should see a message that says "17 Total Stores"
#And I should see the next 6 results
#And I should see the long name, city, distance, phone number and store type for each of the next 6 results
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
