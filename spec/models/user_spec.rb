require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a username, email, and password" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)

    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)

    expect(user).not_to be_valid
  end

  it "does not allow duplicate usernames" do
    create(:user, username: "commander")
    duplicate_user = build(:user, username: "commander")

    expect(duplicate_user).not_to be_valid
  end

  it "does not allow duplicate emails" do
    create(:user, email: "commander@example.com")
    duplicate_user = build(:user, email: "commander@example.com")

    expect(duplicate_user).not_to be_valid
  end
end