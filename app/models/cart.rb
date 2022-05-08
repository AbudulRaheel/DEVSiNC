# frozen_string_literal: true

# Cart
class Cart < ApplicationRecord
  belongs_to :coupon, optional: true
  belongs_to :user

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  # coupon validation
  # validate :validate_coupon

  # def validate_coupon
  #   errors.add(:code, 'Invalid couponzzz') if coupon.present? && coupon.expiry_date >= Time.zone.today
  # end
end
