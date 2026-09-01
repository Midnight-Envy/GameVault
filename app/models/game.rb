class Game < ApplicationRecord
  has_many :game_entries
  has_many :users, through: :game_entries
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :developer, presence: true
  validates :release_year, presence: true
  validates :genre, presence: true
end
