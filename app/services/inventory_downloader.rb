require "open-uri"
require "csv"

class InventoryDownloader

  INVENTORY_URL = 'https://pastebin.com/raw/fBzKySt2'

  # Format of inventory:
  # inventory_id, name, price

  def download(inventory_url, inventory_format)
    # Passing these parameters should more properly be done in a 
    # separate method, using the params.require(...).permit(...) syntax.
    inventory_url ||= INVENTORY_URL
    inventory_format ||= 'csv' # csv / json

    inventory = URI.open(inventory_url).read


    case inventory_format
    when 'json'
      # parse json here
    when 'csv'
      CSV.parse(inventory) do |line|
        if !Coat.exists?(inventory_id: line[0])
          Coat.create(inventory_id: line[0], name: line[1], price: line[2])
        end
      end
    else
      return "Invalid format: #{inventory_format}"
    end

    { success: true }
    
  end

end