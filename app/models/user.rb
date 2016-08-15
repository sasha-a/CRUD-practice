require 'bcrypt'

class User < ActiveRecord::Base

  has_many :restaurants

  validates :username, :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
     self.hashed_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end
end