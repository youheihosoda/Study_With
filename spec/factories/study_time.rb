FactoryBot.define do
  factory :study_time do
    study_method { "test" }
    association :user
  end
end