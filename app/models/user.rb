class User < ApplicationRecord
  has_many :articles

  before_save {self.email = email.downcase}

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validate :has_password

  private

  def has_password
    if self.password == ""
      errors.add("Password cannot be empty.")
    end
  end
end
