class User < ApplicationRecord
  has_many :articles

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true
end
