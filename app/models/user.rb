class User < ApplicationRecord
  validates :email, :name, :password, :password_confirmation, presence: true
end
