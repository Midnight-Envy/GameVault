class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, numericality: { in: 1..10 }
end
