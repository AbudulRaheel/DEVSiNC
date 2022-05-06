# frozen_string_literal: true

# Coupon
class Coupon < ApplicationRecord
  # validations
  validates :code, presence: true, uniqueness: true, length: { minimum: 4, maximum: 10 }, format: { with: /[0-9A-Z]/ }
  validates :discount, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                       numericality: { greater_than: 0, less_than: 1 }
  validates :expiry_date, presence: true
  validate :validate_coupon_code
  validate :validate_expiry_date

  private

  def validate_coupon_code
    errors.add(:code, 'must contain at-least one character') unless /[A-Z]/.match?(code)
  end

  def validate_expiry_date
    return if expiry_date >= Time.zone.today

    errors.add(:code, 'Invalid Date, It should not be in Past')
  end
end
