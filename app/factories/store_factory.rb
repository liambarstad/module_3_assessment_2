module StoreFactory

  def self.initialize_from_json(json)
    json["stores"].map do |store|
      OpenStruct.new(total: json["total"],
                     name: store["longName"],
                     distance: store["distance"],
                     phone_number: store["phone"],
                     type: store["storeType"])
    end
  end

end
