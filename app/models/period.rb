class Period < ApplicationRecord
  belongs_to :period_type
  belongs_to :user

  period_numbers = []

  for i in 1..10
    period_numbers.push i
  end

  PERIOD_NUMBERS = period_numbers
end
