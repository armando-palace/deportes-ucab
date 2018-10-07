class Tournament < ApplicationRecord
  belongs_to :sport
  has_many :teams,  dependent: :destroy
  has_many :users,  dependent: :destroy
end
