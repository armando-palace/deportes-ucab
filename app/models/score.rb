class Score < ApplicationRecord
  belongs_to :game, optional: true
  belongs_to :team, optional: true
  belongs_to :player, optional: true
end
