FactoryBot.define do
  factory :user do #factory :testuser, class: User do のようにクラスを明示すればモデル名以外のデータも作れます。
    name { "test" }
    email { "test@test.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end
