class Recipe < ApplicationRecord
  validates :title, :material, :process, :photo, presence: true
  belongs_to :user
  has_many :favorites
  mount_uploader :photo, PhotoUploader
end
