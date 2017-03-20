class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews
  validates :email, uniqueness: {case_sensitive: false}
  validates :name, :email, presence: true
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 6 }

end
