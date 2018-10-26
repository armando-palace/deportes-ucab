class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  has_many :player_teams, dependent: :destroy
  has_many :players, through: :player_teams
  has_many :team_games, dependent: :destroy
  has_many :games, through: :team_games
  # has_many :winner_team_games, dependent: :destroy
  # has_many :games, through: :winner_team_games

  accepts_nested_attributes_for :players

  validates_presence_of :name
end
