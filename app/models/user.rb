class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
