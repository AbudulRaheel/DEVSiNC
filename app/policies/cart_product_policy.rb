# frozen_string_literal: true

# CartProductPolicy
class CartProductPolicy < ApplicationPolicy
  # CartProductPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    @record.product.user != @user
  end
end
