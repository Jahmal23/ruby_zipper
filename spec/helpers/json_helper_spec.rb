require 'rails_helper'
require 'spec_helper'


describe 'Getting an Openstruct' do
  let(:helper_wrapper) { Class.new { include JsonHelper } }
  let(:valid_json) {

    '{
        "id": 1,
        "name": "A green door",
        "price": 12.50,
        "tags": ["home", "green"]
    }'
  }

  it 'should return an Openstruct' do
    struct = helper_wrapper.new.json_to_openstruct(valid_json)
    expect(struct).not_to be_nil
    expect(struct.id).to eq(1)
  end

  it 'should handle empty and nil json' do
    expect(helper_wrapper.new.json_to_openstruct("")).to be_nil
    expect(helper_wrapper.new.json_to_openstruct(nil)).to be_nil
  end

  it 'should handle invalid json' do
    expect(helper_wrapper.new.json_to_openstruct("invalid json")).to be_nil
  end

  it 'should handle actual white page api complex json result' do
    white_page_json = ZipCodeSearchService.new.fake_white_page_search_results
    struct = helper_wrapper.new.json_to_openstruct(white_page_json)

    expect(struct).not_to be_nil
    expect(struct.results.count).to eq(2)
    expect(struct.results[0].locations.count).to eq(1)

    expect(struct.results[0].locations[0].legal_entities_at.count).to eq(2)

    # could be many but just get the name first person in the household
    expect(struct.results[0].locations[0].legal_entities_at[0].names.count).to eq(1)

    # deep down here could be many names, but once again don't bother going deeper than the first level
    expect(struct.results[0].locations[0].legal_entities_at[0].names[0].first_name).to eq("Elias")
    expect(struct.results[0].locations[0].legal_entities_at[0].names[0].last_name).to eq("Oliveira")

    # basic city zip verification
    expect(struct.results[0].locations[0].standard_address_line1).to eq("1928 Constance St")
    expect(struct.results[0].locations[0].city).to eq("New Orleans")
    expect(struct.results[0].locations[0].postal_code).to eq("70130")
  end
end

