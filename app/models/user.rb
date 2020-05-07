class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :validatable
  devise :database_authenticatable, :registerable, :rememberable
  has_many :carts
end
