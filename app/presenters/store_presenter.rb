class StorePresenter
  attr_reader :stores,
              :page,
              :search

  def initialize(stores, args)
    @stores = stores
    @page = args[:page]
    @search = args[:search]
  end

  def count
    stores[0].total
  end

  def total_pages
    stores[0].total_pages
  end

end

