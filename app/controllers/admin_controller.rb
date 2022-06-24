class AdminController < ApplicationController
  # Let's pretend there is authentication for these endpoints

  def load_inventory
    result = InventoryDownloader.new.download
    render json: result
  end

  def fulfill_order
    coat_order = CoatOrder.find_by(id: params[:id])
    if coat_order.sent?
      render json: { error: "Order already fulfilled"}, status: :bad_request and return
    end

    # Let's pretend we're sending the email to the user here.
    coat_order.update(sent: true)

    render json: coat_order
  end

end