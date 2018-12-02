class User < ActiveRecord::Base
  has_secure_password

  has_many :carts
  has_many :orders

  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end

  def current_cart=(cart)
    self.current_cart_id = cart.id
  end
end
