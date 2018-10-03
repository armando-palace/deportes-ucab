class Tournament < ApplicationRecord
  belongs_to :sport 
  has_many :teams
  has_many :users
end
