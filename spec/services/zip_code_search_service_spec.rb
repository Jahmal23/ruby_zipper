require 'rails_helper'
require 'spec_helper'

describe 'Basic zip code search' do
  let!(:names) { FactoryGirl.create_list(:name, 4) }
  let(:valid_zip_code) {"11103"}

  it 'should return a list of json results' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(valid_zip_code, names)

    expect(result.count).to eq(4)

    result.each do |r|
      expect {
        JSON.parse(r)
      }.to_not raise_error
    end
  end

  it 'should handle an empty list of names' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(valid_zip_code, [])

    expect(result.count).to eq(0)
  end

  it 'should handle nil names' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(valid_zip_code, nil)

    expect(result.count).to eq(0)
  end

  it 'build a url' do
    url = ZipCodeSearchService.new.build_api_url("123","foo","key")

    expect(url).to eq("https://proapi.whitepages.com/2.2/person.json?last_name=foo&postal_code=123&api_key=key")
  end
end