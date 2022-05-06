# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  # include Pundit::Authorization
  before_action :authenticate_user!
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :load_session_cart, if: :devise_controller?

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def load_session_cart
    return unless !session[:cart].nil? && user_signed_in? && !session[:cart].empty?

    load_items_in_cart
    session[:cart].clear
  end

  def load_items_in_cart
    session[:cart].each do |item|
      unless Product.find(item['product_id']).user == current_user
        CartProduct.create(cart_id: current_user.cart.id, product_id: item['product_id'])
      end
    end
  end
end
