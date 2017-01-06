require 'rails_helper'
require 'spec_helper'

describe 'Getting a list of persons' do
  let(:nola_zip) { "70130" }
  let(:slidell_zip) { "70461" }

  context 'single json result' do
    it 'Converts json results to a list of persons' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results

      persons = PersonService.new.get_persons_from_json(white_page_json, nola_zip)

      expect(persons.count).to eq(2)

      expect(persons[0].first_name).to eq("Elias")
      expect(persons[0].last_name).to eq("Oliveira")
      expect(persons[0].address).to eq("1928 Constance St")
      expect(persons[0].city).to eq("New Orleans")
      expect(persons[0].zip).to eq("70130")

      # only the second person has a phone number
      expect(persons[0].phone_number).to be_nil


      expect(persons[1].first_name).to eq("Nina")
      expect(persons[1].last_name).to eq("Oliveira")
      expect(persons[1].address).to eq("1017 Race St")
      expect(persons[1].city).to eq("New Orleans")
      expect(persons[1].zip).to eq("70130")
      expect(persons[1].phone_number).to eq("9203210153")
    end


    it 'Should handle complex phone number scenarios' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results_with_bogus_results

      persons = PersonService.new.get_persons_from_json(white_page_json, slidell_zip)

      expect(persons[0].phone_number).to be_nil
      expect(persons[1].phone_number).to be_nil
      expect(persons[2].phone_number).to be_nil
      expect(persons[4].phone_number).to be_nil
      expect(persons[5].phone_number).to be_nil

      # only the 4th person has a phone number
      expect(persons[3].phone_number).to eq("9856492083")
    end

    it 'Should handle invalid data' do
      persons = PersonService.new.get_persons_from_json("bad_json", nola_zip)

      expect(persons.count).to eq(0)
    end

    it 'Should handle nil' do
      persons = PersonService.new.get_persons_from_json(nil, nola_zip)

      expect(persons.count).to eq(0)
    end

    it 'Should handle empty results' do
      empty_results = ZipCodeSearchService.empty_white_page_search_results

      persons = PersonService.new.get_persons_from_json(empty_results, nola_zip)

      expect(persons.count).to eq(0)
    end
  end

  context 'A list of json results' do
    it 'Should get create a list of persons' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results

      json_list = [white_page_json, white_page_json, white_page_json]

      persons = PersonService.new.get_persons_from_json_list(json_list, nola_zip)

      # each fake json result from white pages contains 2 people
      expect(persons.count).to eq(2 * 3)
    end

    it 'Should discard bad persons from the results' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results_with_bogus_results

      json_list = [white_page_json, white_page_json, white_page_json]

      persons = PersonService.new.get_persons_from_json_list(json_list, slidell_zip)

      # 21 total results, with 3 bad mixed in
      expect(persons.count).to eq(21 - 3)
    end

    it 'Should handle an empty results list' do
      persons = PersonService.new.get_persons_from_json_list([], nola_zip)

      expect(persons.count).to eq(0)
    end

    it 'Should handle a nil results list' do
      persons = PersonService.new.get_persons_from_json_list(nil, nola_zip)

      expect(persons.count).to eq(0)
    end
  end
end