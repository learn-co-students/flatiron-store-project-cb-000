class CartsController < ApplicationController
	before_action :set_cart

	def show
	end

	def checkout
		if @cart
			@cart.update_attributes(status: 'submitted')
			@cart.line_items.each do |line_item|
				@cart.remove_item(line_item.item_id)
			end
			current_user.remove_cart
			redirect_to cart_path(@cart), notice: "Checkout successful, your order is being processed"
		end
	end

	private
		def set_cart
			@cart = Cart.find_by(id: params[:id])
		end

end
