class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { minimum: 7 }

    # verify user on login
  def self.authenticate_with_credentials( email, password)
    email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user.authenticate(password)
    end
    return nil
  end
end