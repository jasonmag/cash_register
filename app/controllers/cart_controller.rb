class CartController < ApplicationController
  def show
    @cart_items = CartPricingService.new(session[:cart]).items
  end

  def add
    product_id = params[:id]
    session[:cart] ||= {}
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1
    redirect_to cart_path, notice: "Product added to cart"
  end

  def remove
  end
end
