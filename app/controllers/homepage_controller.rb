class HomepageController < ApplicationController
  def homepage
    @products = Product.all
  end
end
