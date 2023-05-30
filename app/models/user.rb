class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  validates :email, :name, :password, :password_confirmation, presence: true
  has_many :recipes
  has_many :favorites

  validate :password_regex

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i

    errors.add :password, 'は半角英数字を1種類ずつ含み6文字以上としてください。'
  end
end
