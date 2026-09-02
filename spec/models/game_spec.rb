require "rails_helper"

RSpec.describe Game, type: :model do
  it "is valid with a name, developer, release year, and genre" do
    game = build(:game)

    expect(game).to be_valid
  end

  it "is invalid without a name" do
    game = build(:game, name: nil)

    expect(game).not_to be_valid
  end

  it "is invalid without a developer" do
    game = build(:game, developer: nil)

    expect(game).not_to be_valid
  end

  it "is invalid without a release year" do
    game = build(:game, release_year: nil)

    expect(game).not_to be_valid
  end

  it "is invalid without a genre" do
    game = build(:game, genre: nil)

    expect(game).not_to be_valid
  end

  it "does not allow duplicate names" do
    create(:game, name: "Halo 3")
    duplicate_game = build(:game, name: "Halo 3")

    expect(duplicate_game).not_to be_valid
  end
end