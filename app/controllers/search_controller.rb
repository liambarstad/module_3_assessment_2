class SearchController < ApplicationController

  def index
    best_buy_service = BestBuyService.new(search_params)
    stores = best_buy_service.get_stores
    @stores_presenter = StorePresenter.new(stores)
  end

  private

    def search_params
      params.permit(:search, :batch)
    end

end
