class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :users
end
