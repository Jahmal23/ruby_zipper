class SearchController < ApplicationController
  def index
  end

  def search
    names_to_search = NameService.new.get_searchable_names

    if Rails.env.development?
      search_result_json =  ZipCodeSearchService.fake_white_page_search_results
    else
      search_result_json =  ZipCodeSearchService.new.get_zip_code_last_name_results(params[:zip], names_to_search)
    end

    @persons = PersonService.new.get_persons_from_json_list(search_result_json)

    render json: @persons.to_json
  end

  private
  def search_params
    params.permit(:zip)
  end
end
