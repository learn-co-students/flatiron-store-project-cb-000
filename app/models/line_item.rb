class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :item



	def update_quantity(quantity)
		updated_quantity = quantity
		updated_quantity += 1
	  self.update(quantity: updated_quantity)	
	end 

	def self.create_current_cart(user)
		binding.pry
		@cart = user.carts.create
			user = user 
			user.cart_id = @cart.id
			user.save
			session[:cart_id] = @cart.id
			binding.pry
	end 
end
