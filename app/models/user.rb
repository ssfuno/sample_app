class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates :email, :name, :password, :password_confirmation, presence: true
  has_many :recipes
  has_many :favorites
end
