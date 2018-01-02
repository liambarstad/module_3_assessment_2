class StorePresenter
  attr_reader :stores

  def initialize(stores)
    @stores = stores
  end

  def count
    stores[0].total
  end

end

