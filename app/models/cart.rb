class Cart < ApplicationRecord
  belongs_to :coupon, optional: true
  belongs_to :user

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

#coupon validation
  validate :validate_coupon

  def validate_coupon
    if coupon
      return if coupon.expiry_date > Time.zone.today

      errors.add(:code, 'Invalid coupon')
    end
  end
end
