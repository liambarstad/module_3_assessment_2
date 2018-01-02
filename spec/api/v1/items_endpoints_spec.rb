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
    item1 = create(:item)

    get '/api/v1/items/1'
    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result["id"]).to eq(item1.id)
    expect(result["name"]).to eq(item1.name)
    expect(result["description"]).to eq(item1.description)
    expect(result["image_url"]).to eq(item1.image_url)
    expect(result["created_at"]).to eq(nil)
    expect(result["updated_at"]).to eq(nil)
  end

  it "to delete one item" do
    item = create(:item)

    delete '/api/v1/items/1'
    
    expect(response.status).to eq(204)
    
    new_item = Item.find_by(id: item.id)

    expect(new_item).to eq(nil)
  end

  it "to create an item" do
    
    post '/api/v1/items', params: { name: "newthing", description: "this new thang", image_url: "image" }
    result = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(result["id"]).to eq(1)
    expect(result["name"]).to eq("newthing")
    expect(result["description"]).to eq("this new thang")
    expect(result["image_url"]).to eq("image")
  end
end
