class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }

end
