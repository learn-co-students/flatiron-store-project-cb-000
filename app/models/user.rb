class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: "Cart", foreign_key: 'current_cart_id'

  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def add_cart
    self.current_cart_id = carts.create.id
    save
  end

  def remove_cart
    Cart.find(self.current_cart_id).destroy
    self.current_cart_id = nil
    save
  end

  def get_name
    self.email.split('@')[0].capitalize
  end
end
