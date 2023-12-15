class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def create
    logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:cart].delete(id)
    vehicle = Vehicle.find(id)
    flash[:notice] = " #{vehicle.vehicle_name} removed from cart."
    redirect_to root_path
  end

  def index

  end

  private

  def initialize_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def total_price_with_tax(vehicle, quantity)
    # Retrieve the current user's province's tax rates
    province = current_user.province
    pst = province.pst
    gst = province.gst
    hst = province.hst

    # Calculate the total tax rate for the province
    total_tax_rate = pst + gst + hst

    # Calculate the total price
    price = vehicle.price_cents * quantity
    total_price = price + (price * total_tax_rate)

    # Return the total price including taxes
    total_price
  end
end
