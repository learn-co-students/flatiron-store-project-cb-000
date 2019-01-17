class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :order
  has_many :line_items
end
