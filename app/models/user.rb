class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
end
