class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { minimum: 7 }
end
