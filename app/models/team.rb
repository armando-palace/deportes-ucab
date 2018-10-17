class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  has_many :t_shirts
end
