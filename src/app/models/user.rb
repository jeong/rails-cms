class User < ApplicationRecord
  VALID_USERNAME_REGEX = /\A[\w\-_\.]+\z/
  validates :username,
    presence: true,
    length: { minimum: 3, maximum: 25 },
    format: { with: VALID_USERNAME_REGEX }

  VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-]+\.[a-z]+\z/
  validates :email,
    presence: true,
    length: { maximum: 105 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
