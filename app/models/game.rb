class Game < ApplicationRecord
  belongs_to :pairing

  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games
  # has_one :winner_team, through: :team_games, class_name: "Team", source: :team
  # has_one :winner_team, class_name: "Team"
end
