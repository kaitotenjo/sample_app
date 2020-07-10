class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.NAME}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: {maximum: Settings.EMAIL},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.PW}
end
