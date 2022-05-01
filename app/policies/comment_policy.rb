# frozen_string_literal: true

# COmment Policy
class CommentPolicy < ApplicationPolicy
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

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
