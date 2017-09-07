class LineItemsController < ApplicationController


	def create 
		
		if !current_user.current_cart.present?
			   #LineItem.create_current_cart(current_user)
		  @cart = current_user.carts.create
			@user = current_user 
			@user.cart_id = @cart.id
			@user.save
			session[:cart_id] = @cart.id
		end

		item = Item.find(params[:item_id])
		
		if current_user.current_cart.items.include?(item)
			current_user.current_cart.line_items.each do |line_item|
		 	  if line_item.item_id == item.id 
					line_item.update_quantity(line_item.quantity)  
		    end
	  	 end 
		else
			item.line_items.create(quantity: 1, cart: current_user.current_cart)
		 end 
			redirect_to cart_path(current_user.current_cart)
	 end 
end
