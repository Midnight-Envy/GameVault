class GameEntry < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :status, presence: true
  validates :rating, numericality: { in: 1..10 }, allow_nil: true
  validates :hours_played, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :playing, -> { where(status: "Playing") }
  scope :completed, -> { where(status: "Completed") }
  scope :backlog, -> { where(status: "Backlog") }
end
