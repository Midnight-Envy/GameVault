FactoryBot.define do
  factory :review do
    user { nil }
    game { nil }
    title { "MyString" }
    body { "MyText" }
    rating { 1 }
  end
end
