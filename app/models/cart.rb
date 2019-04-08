class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.sum {|line_item| line_item.quantity * line_item.item.price}
  end

end
