class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    available_items = []
    Item.all.each do |item|
      if item.inventory >= 1
        available_items << item
      end
    end
    self.where(id: available_items)
  end

  def decrease_inventory(quantity)
    self.inventory -= quantity
    self.save
  end
end
