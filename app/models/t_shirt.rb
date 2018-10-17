class TShirt < ApplicationRecord
  belongs_to :player
  belongs_to :team, optional: true
  belongs_to :tournament, optional: true
end
