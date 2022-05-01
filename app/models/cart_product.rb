class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # validation
  # validates :product_id, uniqueness: { scope: :cart_id, message: 'Product already exist' }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validate :quantity_validations

  private

  def quantity_validations
    return if quantity <= product.quantity

    # errors.add(:code, 'should be less then product quantity')
  end
end
