class TShirt < ApplicationRecord
  belongs_to :player, inverse_of: :t_shirts

  validates_presence_of :dorsal_number
end
