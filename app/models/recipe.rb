class Recipe < ApplicationRecord
  validates :title, :material, :process, presence: true
  mount_uploader :photo, PhotoUploader
end
