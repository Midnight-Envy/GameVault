require "rails_helper"

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    review = build(:review)

    expect(review).to be_valid
  end

  it "is invalid without a title" do
    review = build(:review, title: nil)

    expect(review).not_to be_valid
  end

  it "is invalid without a body" do
    review = build(:review, body: nil)

    expect(review).not_to be_valid
  end

  it "is invalid with a rating below 1" do
    review = build(:review, rating: 0)

    expect(review).not_to be_valid
  end

  it "is invalid with a rating above 10" do
    review = build(:review, rating: 11)

    expect(review).not_to be_valid
  end
end