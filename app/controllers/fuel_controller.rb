class FuelController < ApplicationController
  def index
    @fuels = Fuel.all
  end

  def show
    @fuel = Fuel.find(params[:id])
  end
end
