class CartsController < ApplicationController

 
  def create 
  	@cart = Cart.create 
  	session[:cart_id] = @cart.id
  end 

	def show 
		@user = User.find(current_user.id)
		@current_cart = @user.current_cart
	end 


	def checkout 
		
		@current_cart = Cart.find(params[:id])
		@current_cart.status = "Submitted"
		@current_cart.line_items.each do |line_item|
			@item = Item.find(line_item.item.id)
			@item.inventory = @item.inventory - line_item.quantity
			@item.save
		end
		 current_user.current_cart = nil
		 current_user.save
		redirect_to cart_path(@current_cart.id)
	end
end
