FactoryBot.define do
  factory :study_text do
    name { "test" }
    association :user
  end
end