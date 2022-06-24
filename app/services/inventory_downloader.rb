require "open-uri"
require "csv"

class InventoryDownloader

  INVENTORY_URL = 'https://pastebin.com/raw/fBzKySt2'

  # Format of inventory:
  # inventory_id, name, price

  def download
    inventory = URI.open(INVENTORY_URL).read

    CSV.parse(inventoy) do |line|
      if !Coat.exists?(inventory_id: line[0])
        Coat.create(inventory_id: line[0], name: line[1], price: line[2])
      end
    end

    { success: true }
  end

end