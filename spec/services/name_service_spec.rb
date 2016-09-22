require 'rails_helper'
require 'spec_helper'
require 'database_cleaner'

describe 'Getting names to search' do
  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

 it 'Return a list of searchable names' do
   names = NameService.new.get_searchable_names
   expect(names.count).to be > 0
  end
end