  class CartController < ApplicationController
  def show
    @cart = session[:cart] || {}
    @products = Product.find(@cart.keys)
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
