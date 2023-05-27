class User < ApplicationRecord
  validates :email, :name, :password, :password_confirmation, presence: true
  has_many :recipes
  has_many :favorites
end
