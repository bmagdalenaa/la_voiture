class OrderDetailController < ApplicationController
  def index
    @orderDetails = OrderDetail.all
  end

  def show
    @orderDetail = OrderDetail.find(params[:id])
  end
end
