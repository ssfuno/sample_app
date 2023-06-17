class Recipe < ApplicationRecord
  validates :title, :material, :process, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
