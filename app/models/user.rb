class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates :email, :name, :password_confirmation, presence: true
  has_many :recipes
  has_many :favorites

  validate :password_regex, :email_regrex

  private

  def email_regrex
    return if email.blank? || email =~ /(?=.*?[a-z])(?=.*?\d)(?=.*?@)/
    errors.add :email, 'が正しくありません。'
  end

  def password_regex
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
    errors.add :password, 'は半角英数字を1種類ずつ含み6文字以上としてください。'
  end
end
