class Favorite < ApplicationRecord
  validates :user, :recipe, presence: true
  belongs_to :user
  belongs_to :recipe
end
