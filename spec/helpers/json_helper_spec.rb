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

    obj = helper_wrapper.new.json_to_openstruct('asdajfldsajfladsjf')
  end
end

