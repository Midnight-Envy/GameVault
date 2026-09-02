FactoryBot.define do
  factory :game do
    sequence(:name) { |n| "Game #{n}" }
    developer { "Test Developer" }
    release_year { 2025 }
    genre { "Action" }
  end
end