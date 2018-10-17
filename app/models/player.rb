class Player < ApplicationRecord
  attr_accessor :dorsal_number

  belongs_to :school
  belongs_to :period
  belongs_to :user

  has_many :t_shirts
  has_many :teams, through: :t_shirts

  validates_presence_of :id_card, :first_name, :last_name, :school_id, :period_id

  def name
    "#{first_name} #{last_name}"
  end
end
