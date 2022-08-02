Rails.application.routes.draw do

  # User endpoints
  get  'coats' => 'coats#index'
  post 'coats/:id/order' => 'coats#order'
  
  # Admin endpoints
  post 'admin/load_inventory'
  post 'admin/fulfill_order'
  post 'admin/cancel_order'
  get 'admin/orders' => 'admin#index_orders'

end
