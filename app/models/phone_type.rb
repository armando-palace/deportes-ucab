class PhoneType < ApplicationRecord
  has_many :phones

  MOBILE = 'Mobile'
  HOME   = 'Home'
  WORK   = 'Work'

  PHONE_TYPES = [
    MOBILE,
    HOME,
    WORK
  ]
end
