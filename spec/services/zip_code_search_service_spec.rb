require 'rails_helper'
require 'spec_helper'

describe 'Basic zip code search' do
  it 'should return json results' do
    result = ZipCodeSearchService.new.get_names_for_zip_code(1234)

    expect {
      JSON.parse(result)
    }.to_not raise_error
  end
end