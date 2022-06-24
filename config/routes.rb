Rails.application.routes.draw do

  # User endpoints
  get  'coats' => 'coats#index'
  post 'coats/:id/order' => 'coats#order'

  # Admin endpoints
  post 'admin/load_inventory'
  post 'admin/fulfill_order'

end
