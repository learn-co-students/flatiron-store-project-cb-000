class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_current_cart


  def set_current_cart
    if user_signed_in?
      @cart ||= current_user.current_cart
    end
  end


end
