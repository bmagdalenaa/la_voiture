class SearchesController < ApplicationController
  def result
    @query = params[:query]
    @category = params[:category]

    if @query.present?
      @results = {}
      if @category == 'car_models' || @category.blank?
        @results[:car_models] = CarModel.global_search(@query)
      end
      if @category == 'manufacturers' || @category.blank?
        @results[:manufacturers] = Manufacturer.global_search(@query)
      end
    else
      @results = { car_models: [], manufacturers: [] }
    end
  end
end
