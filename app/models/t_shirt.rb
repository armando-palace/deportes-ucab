class TShirt < ApplicationRecord
  belongs_to :player, inverse_of: :t_shirts
end
