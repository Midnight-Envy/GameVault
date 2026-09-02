FactoryBot.define do
  factory :game_entry do
    association :user
    association :game
    status { "Backlog" }
    rating { 8 }
    hours_played { 10 }
    notes { "Test notes" }
  end
end