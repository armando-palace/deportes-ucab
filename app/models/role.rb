class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  ADMIN       = 'Admin'
  DELEGATE    = 'Delegado'
  PLAYER      = 'Jugador'

  ROLES = [
    ADMIN,
    DELEGATE,
    PLAYER
  ]
end
