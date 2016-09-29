class SearchController < ApplicationController

  def index
  end

  def search
    names_to_search = NameService.new.get_searchable_names

    search_result_json = ZipCodeSearchService.new.get_zip_code_last_name_results(params[:zip], names_to_search)
    @persons = PersonService.new.get_persons_from_json_list(search_result_json)

    render json: @persons.to_json
  end

  private
  def search_params
    params.permit(:zip)
  end
end
