class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :validatable
  devise :database_authenticatable, :registerable, :rememberable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'
end
