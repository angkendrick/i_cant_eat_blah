class User < ActiveRecord::Base

  has_secure_password

  has_many :recipes

  validates :username, :email, uniqueness: true
  validates :username, :first_name, :last_name, presence: true

end
