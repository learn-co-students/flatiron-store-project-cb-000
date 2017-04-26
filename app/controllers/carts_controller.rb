class CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
	end

	def checkout
		Cart.find(params[:id]).checkout
		current_user.current_cart = nil
		redirect_to cart_path
	end
end
