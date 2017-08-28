class User < ApplicationRecord
  has_many :articles

  validates :username, :email, presence: true, uniqueness: true
  validate :has_password
  validate :authenticate

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password_hash)
    @password_check = Password.new(password_hash)
    self.password_hash == @password_check
  end

  private

  def has_password
    if self.password == ""
      errors.add("Password cannot be empty.")
    end
  end
end
