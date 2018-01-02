class BestBuyService

  def initialize(args)
    @search = args[:search]
    @page = args[:page] || 1
    @api_key = ENV["best_buy_key"]
    @distance = args[:distance] || 25
    @page_size = args[:page_size] || 10
  end

  def get_stores
    conn = create_request
    json = JSON.parse(conn.get.body)
    StoreFactory.initialize_from_json(json)
  end

  private
    attr_reader :search,
                :page,
                :api_key,
                :distance,
                :page_size

    def create_request
      Faraday.new("https://api.bestbuy.com/v1/stores" + "(area(#{search},#{distance}))") do |f|
        f.params["format"] = "json"
        f.params["apiKey"] = api_key
        f.params["page"] = page
        f.params["pageSize"] = page_size
        f.adapter Faraday.default_adapter
      end
    end

end
