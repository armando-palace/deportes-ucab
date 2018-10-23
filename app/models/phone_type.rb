class PhoneType < ApplicationRecord
  has_many :phones

  MOBILE = 'Móvil'
  HOME   = 'Casa'
  WORK   = 'Trabajo'

  PHONE_TYPES = [
    MOBILE,
    HOME,
    WORK
  ]
end
