class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  SUPER_ADMIN = 'super_admin'
  ADMIN       = 'admin'
  DELEGATE    = 'delegate'
  PLAYER      = 'player'

  ROLES = [
    SUPER_ADMIN,
    ADMIN,
    DELEGATE,
    PLAYER
  ]
end
