# frozen_string_literal: true

# CheckoutController
class CheckoutController < ApplicationController
  def create
    cart_item_list = load_products_hash
    if cart_item_list.empty?
      render js: 'alert("Cart is Empty");'
    else

      @session = create_checkout_session cart_item_list
      respond_to do |format|
        format.js
      end
    end
  end

  def create_checkout_session(cart_item_list)
    Stripe::Checkout::Session.create({
                                       mode: 'payment',
                                       line_items: cart_item_list,
                                       success_url: complete_url,
                                       cancel_url: root_url
                                     })
  end

  private

  def load_products_hash
    cart_items = CartProduct.includes(:product).where(cart_id: current_user.cart.id)
    coupon = current_user.cart.coupon
    discount = 1 - (coupon ? coupon.discount : 0)
    create_products_map_list cart_items, discount
  end

  def create_products_map_list(cart_items, discount)
    products_map_list = []
    cart_items.each do |item|
      products_map_list << {
        name: item.product.product_name,
        amount: item.product.price.to_i * (discount * 100).to_i,
        currency: 'usd',
        quantity: item.quantity
      }
    end
    products_map_list
  end
end
