class School < ApplicationRecord
  has_many :users
  accepts_nested_attributes_for :users
  
  # Facultad de Ciencias Ecpnómicas y Sociales
  ADMINISTRATION_AND_ACCOUNTING = "Administración y Contaduría"
  SOCIAL_SCIENCES = "Ciencias Sociales"
  ECONOMY = "Economía"

  # Facultad de Derecho
  LAW = "Derecho"

  # Facultad de Humanidades y Educación
  SOCIAL_COMMUNICATION = "Comunicación Social"
  EDUCATION = "Educación"
  PHILOSOPHY = "Filosofía"
  LETTERS = "Letras"
  PSYCHOLOGY = "Psicología"

  # Facultad de Ingeniería
  CIVIL = "Civil"
  INDUSTRIAL = "Industrial"
  COMPUTING = "Informática"
  TELECOMMUNICATIONS = "Telecomunicaciones"

  # Facultad de Teología
  THEOLOGY = "Teología"

  SCHOOLS = [
    ADMINISTRATION_AND_ACCOUNTING,
    SOCIAL_SCIENCES,
    ECONOMY,

    LAW,

    SOCIAL_COMMUNICATION,
    EDUCATION,
    PHILOSOPHY,
    LETTERS,
    PSYCHOLOGY,

    CIVIL,
    INDUSTRIAL,
    COMPUTING,
    TELECOMMUNICATIONS,

    THEOLOGY
  ]
end
