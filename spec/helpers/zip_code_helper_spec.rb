require 'rails_helper'
require 'spec_helper'

describe 'Validating 5 digit US Zip Codes' do
  let(:helper_wrapper) { Class.new { include ZipCodeHelper } }

  it 'should be valid' do
    expect(helper_wrapper.new.valid?("70130")).to be true
    expect(helper_wrapper.new.valid?("11103")).to be true
    expect(helper_wrapper.new.valid?("98503")).to be true
  end

  it 'should not be valid' do
    expect(helper_wrapper.new.valid?("7000")).to be false
    expect(helper_wrapper.new.valid?("923423423423")).to be false
    expect(helper_wrapper.new.valid?("as89300sfsd")).to be false
    expect(helper_wrapper.new.valid?("")).to be false
    expect(helper_wrapper.new.valid?(nil)).to be false
  end
end
