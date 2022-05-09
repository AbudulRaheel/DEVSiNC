# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many_attached :images, dependent: :purge_later

  validates :product_name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }

  validate :product_image_type

  private

  def product_image_type
    errors.add(:images, 'is missing!') unless images.attached?

    images.each do |img|
      errors.add(:images, ' only jpeg/png images are allowed.') unless img.content_type.in?(%('image/jpeg image/png'))
    end
  end
end
