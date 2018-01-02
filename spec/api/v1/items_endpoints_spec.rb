require 'rails_helper'

RSpec.describe "API can access items" do
  it "for all items" do
    item1, item2, item3 = create_list(:item, 3)

    get '/api/v1/items'
    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result.count).to eq(3)
    expect(result[0]["id"]).to eq(item1.id)
    expect(result[1]["id"]).to eq(item2.id)
    expect(result[2]["id"]).to eq(item3.id)
    expect(result[0]["name"]).to eq(item1.name)
    expect(result[0]["description"]).to eq(item1.description)
    expect(result[0]["image_url"]).to eq(item1.image_url)
    expect(result[0]["created_at"]).to eq(nil)
    expect(result[0]["updated_at"]).to eq(nil)
  end

  it "for one item" do

  end

  it "to delete one item" do

  end

  it "to create an item" do

  end
end
