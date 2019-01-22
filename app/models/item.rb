class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :order
  has_many :line_items

  def self.available_items
    self.where('inventory > 0')
  end

  def remove(num)
    update(inventory: inventory - num)
  end

end
