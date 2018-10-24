class Tournament < ApplicationRecord
  belongs_to :sport
  belongs_to :user

  has_many :teams, dependent: :destroy

  validates_presence_of :name
end
