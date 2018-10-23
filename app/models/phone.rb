class Phone < ApplicationRecord
  belongs_to :phone_type, optional: true
  belongs_to :player
end
