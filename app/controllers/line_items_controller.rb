class LineItemsController < ApplicationController
  def create
     @current_cart = current_user.current_cart
     if @current_cart.nil?
       @current_cart = Cart.create(user_id: current_user.id)
       @current_cart.line_items.create(cart_id:@current_cart.id,item_id:params[:item_id])
       current_user.update(current_cart:@current_cart)
     else
       @line_item = @current_cart.line_items.find_by(item_id:params[:item_id])
       if @line_item.nil?
         @current_cart.line_items.create(cart_id:@current_cart.id,item_id:params[:item_id])
       else
         @line_item.update(quantity:@line_item.quantity+1)
       end
     end
     redirect_to cart_path @current_cart
   end
end
