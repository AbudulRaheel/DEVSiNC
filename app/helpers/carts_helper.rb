# frozen_string_literal: true

# CartsHelper
module CartsHelper
  def self.calculate_cart_sub_total(user)
    CartProduct.where(cart_id: user.cart.id)
               .collect do |item|
      item.product.price.to_f * item.quantity
    end.sum
  end
end
