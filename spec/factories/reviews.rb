FactoryBot.define do
  factory :review do
    association :user
    association :game
    title { "Great Game" }
    body { "This is a test review." }
    rating { 9 }
  end
end