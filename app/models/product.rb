# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images, dependent: :purge_later
  has_many :carts, through: :cart_items
end
