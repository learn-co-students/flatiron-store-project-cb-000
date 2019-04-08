class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  has_one :order, through: :cart
end
