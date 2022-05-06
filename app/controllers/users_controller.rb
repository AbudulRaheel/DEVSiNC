# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def show
    @user = current_user
  end
end
