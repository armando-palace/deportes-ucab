class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :teams
  has_many :tournaments
  has_many :players

  # belongs_to :school, optional: true
  # belongs_to :period, optional: true

  # validates_presence_of :id_card, :first_name, :last_name, :email, on: [:update]

  def has_role?(role_name)
    roles.any? {|r| r.name == role_name.to_s}
  end

  def is_admin?
    has_role?("Administrador")
  end

  def is_delegate?
    has_role?("Delegado")
  end

  HUMANIZED_ATTRIBUTES = {
    :password => "Contraseña",
    :password_confirmation => "Confirmación de Contraseña",
    :email => "Correo",
    :user => "Usuario"
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
