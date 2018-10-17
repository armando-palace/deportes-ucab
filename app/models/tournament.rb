class Tournament < ApplicationRecord
  belongs_to :sport
  has_many :teams,  dependent: :destroy
  has_many :user_tournaments, dependent: :destroy
  has_many :users, through: :user_tournaments
end
