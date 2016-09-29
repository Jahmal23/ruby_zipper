require 'rails_helper'
require 'spec_helper'

describe 'Getting a list of persons' do
  context 'single json result' do
    it 'Converts json results to a list of persons' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results

      persons = PersonService.new.get_persons_from_json(white_page_json)

      expect(persons.count).to eq(2)

      expect(persons[0].first_name).to eq("Elias")
      expect(persons[0].last_name).to eq("Oliveira")
      expect(persons[0].address).to eq("1928 Constance St")
      expect(persons[0].city).to eq("New Orleans")
      expect(persons[0].zip).to eq("70130")

      expect(persons[1].first_name).to eq("Nina")
      expect(persons[1].last_name).to eq("Oliveira")
      expect(persons[1].address).to eq("1017 Race St")
      expect(persons[1].city).to eq("New Orleans")
      expect(persons[1].zip).to eq("70130")
    end

    it 'Should handle invalid data' do
      persons = PersonService.new.get_persons_from_json("bad_json")

      expect(persons.count).to eq(0)
    end

    it 'Should handle nil' do
      persons = PersonService.new.get_persons_from_json(nil)

      expect(persons.count).to eq(0)
    end

    it 'Should handle empty results' do
      empty_results = ZipCodeSearchService.empty_white_page_search_results

      persons = PersonService.new.get_persons_from_json(empty_results)

      expect(persons.count).to eq(0)
    end
  end

  context 'A list of json results' do
    it 'Should get create a list of persons' do
      white_page_json = ZipCodeSearchService.fake_white_page_search_results

      json_list = [white_page_json, white_page_json, white_page_json]

      persons = PersonService.new.get_persons_from_json_list(json_list)

      # each fake json result from white pages contains 2 people
      expect(persons.count).to eq(2 * 3)
    end

    it 'Should handle an empty results list' do
      persons = PersonService.new.get_persons_from_json_list([])

      expect(persons.count).to eq(0)
    end

    it 'Should handle a nil results list' do
      persons = PersonService.new.get_persons_from_json_list(nil)

      expect(persons.count).to eq(0)
    end
  end
end