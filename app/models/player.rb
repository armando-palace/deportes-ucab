class Player < ApplicationRecord
  attr_accessor :dorsal_number

  belongs_to :school
  belongs_to :period

  has_many :t_shirts
  has_many :teams, through: :t_shirts
end
