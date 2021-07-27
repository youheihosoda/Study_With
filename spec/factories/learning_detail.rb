FactoryBot.define do
  factory :learning_detail do
    detail { "test" }
    association :user
  end
end