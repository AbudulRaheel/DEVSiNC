class Product < ApplicationRecord
  has_many :comments
  belongs_to :users
end
