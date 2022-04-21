class Product < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many_attached :images
end
