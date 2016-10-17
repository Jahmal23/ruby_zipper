class SearchController < ApplicationController
  def index
  end

  def search
    names_to_search = NameService.new.get_searchable_names

    if Rails.env.development?
      faker = ZipCodeSearchService.fake_white_page_search_results
      search_result_json_list = [faker, faker, faker, faker, faker]
    else
      search_result_json_list =  ZipCodeSearchService.new.get_zip_code_last_name_results(params[:zip], names_to_search)
    end

    @persons = PersonService.new.get_persons_from_json_list(search_result_json_list)

    render json: @persons.to_json
  end

  private
  def search_params
    params.permit(:zip)
  end
end
