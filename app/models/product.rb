class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images, dependent: :destroy
end
