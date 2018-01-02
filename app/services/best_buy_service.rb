class BestBuyService

  def initialize(args)
    @search = args[:search]
    @batch = args[:batch]
    @api_key = ENV["best_buy_key"]
    @distance = args[:distance] || 25
  end

  def get_stores
    conn = create_request
    StoreFactory.initialize_from_json(conn.get)
  end

  private
    attr_reader :search,
                :batch,
                :api_key,
                :distance

    def create_request
      Faraday.new("https://api.bestbuy.com/v1/stores" + "(area(#{search},#{distance}))") do
        params["format"] = "json"
        params["api_key"] = api_key
      end
    end

end
