require 'rails_helper'
require 'spec_helper'

RSpec.describe SearchController, type: :controller do
  describe '#search' do
    before(:each) do
      WebMock.stub_request(:any, /proapi.whitepages.com/)
          .to_return(status: 201, body: ZipCodeSearchService.fake_white_page_search_results)
    end

    context 'has valid attributes' do
      before(:each) do
        search_params =  {"zip"=>"70130"}
        get :search, search_params
      end

      it 'is successful' do
        expect(response).to be_success
      end

      it 'should return a person list' do
        persons = assigns(:persons)
        expect(persons.count).to eq(2)
      end

      it 'responds with JSON' do
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end
    end
  end
end
