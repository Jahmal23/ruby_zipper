class SearchController < ApplicationController

  def index
  end

  def search
    search_result_json = ZipCodeSearchService.new.get_names_for_zip_code(params[:zip])
    @persons = PersonService.new.get_persons_from_json(search_result_json)

    render json: @persons.to_json
  end

  private
  def search_params
    params.permit(:zip)
  end
end
