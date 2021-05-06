class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true,
    format: {with: /\w+@\w+/}
  validates :name, presence: true, uniqueness: true
  has_secure_password

end
