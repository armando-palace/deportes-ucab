class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  has_many :player_teams
  has_many :players, through: :player_teams

  accepts_nested_attributes_for :players
end
