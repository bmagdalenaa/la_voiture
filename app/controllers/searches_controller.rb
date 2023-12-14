class SearchesController < ApplicationController
  def result
    @query = params[:query]

    @results = {
      car_models: CarModel.global_search(@query),
      manufacturers: Manufacturer.global_search(@query)
    }
  end
end
