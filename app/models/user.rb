class User < ApplicationRecord
  validates :fullname, :username, :address, :age, :email, :password_digest, presence: true
  validates :password_digest, length: {minimum: 3, maximum: 10}
  validates :password_digest, confirmation: true
  validates :password_digest_confirmation, presence: true
end
