# frozen_string_literal: true

# Orders controller
class OrdersController < ApplicationController
  before_action :find_order_details

  def index
    @orders = current_user.orders
  end

  def complete
    ActiveRecord::Base.transaction do
      order = Order.create(user_id: current_user.id, coupon_id: @cart.coupon_id, total: @total_amount)
      @cart_items.each do |item|
        OrderDetail.create(order_id: order.id, product_id: item.product_id, quantity: item.quantity)
        item.product.decrement!(:quantity, item.quantity)
      end
      create_order
    end
    redirect_to orders_url, notice: 'Order Complete Sucessfully'
  end

  def detail
    order = Order.find(params[:order_id])
    @order_items_list = order.order_details.eager_load(:product)
  end

  private

  def create_order
    if @cart_items.destroy_all
      @cart.update(coupon_id: nil)
    else
      flash.alert = 'Error: Order incomplete!'
    end
  end

  def find_order_details
    @cart = current_user.cart
    @cart_items = @cart.cart_products
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
    @coupon = @cart.coupon
    @total_amount = @cart_sub_total * (@coupon.nil? ? 1 : (1 - @coupon.discount))
  end
end
