class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :phones

  validates_presence_of :id_card, :first_name, :last_name, :email

  def has_role?(role_name)
    roles.any? {|r| r.name == role_name.to_s}
  end

  def is_super_admin?
    has_role?(:super_admin)
  end

  def is_admin?
    has_role?(:admin) || role?(:super_admin)
  end
end
