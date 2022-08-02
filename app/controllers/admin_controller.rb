class AdminController < ApplicationController
  # Let's pretend there is authentication for these endpoints

  def load_inventory
    result = InventoryDownloader.new.download(params[:inventory_url], params[:inventory_format])
    render json: result
  end

  def index_orders
    coat_orders = CoatOrder.all
    render json: coat_orders
  end
  
  def cancel_order
    coat_order = CoatOrder.find_by(id: params[:id])
    
    if coat_order.nil?
      render json: { error: "Order with id #{params[:id]} not found." }, status: :not_found and return
    elsif coat_order.shipped?
      render json: { error: "Cannot cancel order #{params[:id]} because it has already shipped." }, status: :bad_request and return
    end

    coat_order.cancelled!

    render json: coat_order
  end
  
  def fulfill_order
    coat_order = CoatOrder.find_by(id: params[:id])
    if not coat_order.created?
      render json: { error: "Order already fulfilled"}, status: :bad_request and return
    end

    # Let's pretend we're sending the email to the user here.
    coat_order.packaging!

    render json: coat_order
  end

end