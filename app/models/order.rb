# frozen_string_literal: true

# Order class
class Order < ApplicationRecord
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy
  belongs_to :user
  belongs_to :coupon, optional: true
end
