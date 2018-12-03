module CartsHelper
  def add_to_cart(item)
    if user_signed_in?
      if current_user.current_cart.nil?
        current_user.new_cart
      end
      render partial: 'add_to_cart', locals: { cart: current_user.current_cart, item: item }
    end
  end

  def link_to_cart
    if user_signed_in?
      if current_user.current_cart
        link_to "Cart", cart_path(current_user.current_cart)
      end
    end
  end

end