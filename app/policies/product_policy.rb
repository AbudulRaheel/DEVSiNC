# frozen_string_literal: true

# Product Policy
class ProductPolicy < ApplicationPolicy
  # Scope for policy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def update?
    @record.user == @user
  end

  def index
    update?
  end

  def myproducts
    update?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
