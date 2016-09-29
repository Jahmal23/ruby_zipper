require 'rails_helper'
require 'spec_helper'

RSpec.describe SearchController, type: :controller do
  describe '#search' do
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
        expect(persons.count).to be > 0
      end

      it 'responds with JSON' do
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end
    end
  end
end
