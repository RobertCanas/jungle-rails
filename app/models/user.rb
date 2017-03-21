class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews
  validates :email, uniqueness: {case_sensitive: false}, case_sensitive: false
  validates :name, :email, presence: true
  validates :password_digest, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
