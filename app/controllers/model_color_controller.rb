class ModelColorController < ApplicationController
  def index
    @modelColors = ModelColor.all
  end

  def show
    @modelColor = ModelColor.find(params[:id])
  end
end
