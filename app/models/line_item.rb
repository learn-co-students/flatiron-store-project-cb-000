class LineItem < ActiveRecord::Base
  #join table
  belongs_to :item
  belongs_to :cart
end
