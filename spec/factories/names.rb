FactoryGirl.define do
  factory :name do
    sequence(:last) {|n| "lastname #{n}" }
  end
end
