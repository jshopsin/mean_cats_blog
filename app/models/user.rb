class User < ApplicationRecord
  has_many :articles

  validates :username, :email, presence: true, uniqueness: true
  validate :has_password

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def has_password
    if self.password == ""
      errors.add("Password cannot be empty.")
    end
  end
end
