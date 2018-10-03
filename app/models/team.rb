class Team < ApplicationRecord
  belongs_to :tournament
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams
end
