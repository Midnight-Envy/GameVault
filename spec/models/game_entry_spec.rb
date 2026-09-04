require "rails_helper"

RSpec.describe GameEntry, type: :model do
  it "is valid with valid attributes" do
    game_entry = build(:game_entry)

    expect(game_entry).to be_valid
  end

  it "is invalid without a status" do
    game_entry = build(:game_entry, status: nil)

    expect(game_entry).not_to be_valid
  end

  it "is invalid with a rating below 1" do
    game_entry = build(:game_entry, rating: 0)

    expect(game_entry).not_to be_valid
  end

  it "is invalid with a rating above 10" do
    game_entry = build(:game_entry, rating: 11)

    expect(game_entry).not_to be_valid
  end

  it "is invalid with negative hours played" do
    game_entry = build(:game_entry, hours_played: -1)

    expect(game_entry).not_to be_valid
  end

  it "does not allow the same user to add the same game twice" do
    user = create(:user)
    game = create(:game)

    create(:game_entry, user: user, game: game)
    duplicate_entry = build(:game_entry, user: user, game: game)

    expect(duplicate_entry).not_to be_valid
  end

  it "returns playing games with the playing scope" do
    playing_entry = create(:game_entry, status: "Playing")
    create(:game_entry, status: "Completed")

    expect(GameEntry.playing).to include(playing_entry)
  end

  it "returns completed games with the completed scope" do
    completed_entry = create(:game_entry, status: "Completed")
    create(:game_entry, status: "Backlog")

    expect(GameEntry.completed).to include(completed_entry)
  end

  it "returns backlog games with the backlog scope" do
    backlog_entry = create(:game_entry, status: "Backlog")
    create(:game_entry, status: "Playing")

    expect(GameEntry.backlog).to include(backlog_entry)
  end

  it "doesnt allow no rating when is completed" do
    game_entry =build(:game_entry, status: "Completed", rating:nil)

    expect(game_entry).not_to be_valid
  end

end