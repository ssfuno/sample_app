class User < ApplicationRecord
  validates :title, :material, :process, presence: true
end
