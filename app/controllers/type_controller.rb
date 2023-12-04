class TypeController < ApplicationController
  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
  end
end
