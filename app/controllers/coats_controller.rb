class CoatsController < ApplicationController

  def index
    coats = Coat.all
    render json: coats
  end

  def order
    coat = Coat.find_by(id: params[:id])

    if coat.nil?
      render json: { error: "Coat with id #{params[:id]} not found." }, status: :not_found and return
    elsif params[:email].blank?
      render json: { error: "Please provide your email." }, status: :bad_request and return
    end

    coat_order = coat.coat_orders.create(email: params[:email])

    render json: coat_order
  end

end