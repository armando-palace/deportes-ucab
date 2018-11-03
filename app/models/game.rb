class Game < ApplicationRecord
  belongs_to :pairing

  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games
  has_many :winner_team_games, dependent: :destroy
  has_many :winner_teams, through: :winner_team_games, class_name: "Team", source: :team
end
