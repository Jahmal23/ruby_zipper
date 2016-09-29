require 'rails_helper'
require 'spec_helper'

describe 'Basic zip code search' do
  let!(:names) { FactoryGirl.create_list(:name, 4) }

  it 'should return a list of json results' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(1234, names)

    expect(result.count).to eq(4)

    result.each do |r|
      expect {
        JSON.parse(r)
      }.to_not raise_error
    end
  end

  it 'should handle an empty list of names' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(1234, [])

    expect(result.count).to eq(0)
  end

  it 'should handle nil names' do
    result = ZipCodeSearchService.new.get_zip_code_last_name_results(1234, nil)

    expect(result.count).to eq(0)
  end
end