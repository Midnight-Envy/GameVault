class User < ApplicationRecord
  has_secure_password

  has_many :game_entries
  has_many :games, through: :game_entries
  has_many :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
