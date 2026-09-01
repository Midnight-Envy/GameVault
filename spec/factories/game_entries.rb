FactoryBot.define do
  factory :game_entry do
    user { nil }
    game { nil }
    status { "MyString" }
    rating { 1 }
    hours_played { 1 }
    notes { "MyText" }
  end
end
