class LineItemsController < ApplicationController

	def create
		unless current_user.current_cart
			current_user.add_cart
		end
		@cart = current_user.current_cart
		line_item = @cart.add_item(params[:item_id])
		if line_item.save
			redirect_to cart_path(@cart), notice: "The item was successfully added to your cart."
		else
			redirect_to store_path, alert: "Unable to add item to your cart, try again."
		end
	end

end
