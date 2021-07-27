FactoryBot.define do
  factory :post_comment do
    comment { "test" }
    association :user
    association :study_time
  end
end