class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
  has_many :line_items, through: :cart
  has_many :items, through: :line_items
end
