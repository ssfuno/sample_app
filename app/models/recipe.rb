class Recipe < ApplicationRecord
  validates :title, :material, :process, presence: true
end
