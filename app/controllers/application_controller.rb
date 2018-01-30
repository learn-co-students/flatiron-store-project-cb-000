class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :not_found, :set_current_cart, :current_cart
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    return head(:not_found)
  end

  def set_current_cart
    if cart = Cart.find_by(:user_id => current_user)
      session[:cart_id] = cart.id
    else
      cart = current_user.build_cart
      cart.save
      session[:cart_id] = cart.id
    end
  end

  def current_cart
    return current_user.cart if !!current_user
  end

end
