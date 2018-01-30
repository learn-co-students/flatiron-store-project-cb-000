class Order < ActiveRecord::Base
  #associations
  belongs_to :customer, :class_name => "User"
  has_many :line_items
  has_many :items, :through => :line_items

  def total
    sum = 0; line_items.each {|i| sum += i.item.price * i.quantity }; sum
  end


end
