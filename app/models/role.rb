class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  ADMIN       = 'admin'
  DELEGATE    = 'delegate'
  PLAYER      = 'player'

  ROLES = [
    ADMIN,
    DELEGATE,
    PLAYER
  ]
end
