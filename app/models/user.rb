require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts
  include BCrypt

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end
end
