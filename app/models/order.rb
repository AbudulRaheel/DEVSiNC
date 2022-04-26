class Order < ApplicationRecord
  belongs_to :users
  has_one :coupons
end
