class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, :through => :line_items

  def total
    self.line_items.collect do |line_item|
      line_item.item.price * line_item.quantity
    end.sum
  end

  def add_item(item_id)
    if Item.find_by(item_id)
      existing_line_item = self.line_items.where(item_id: item_id).try(:first)
      if existing_line_item.nil?
        return self.line_items.new(item_id: item_id)
      else
        existing_line_item[:quantity] += 1
        return existing_line_item
      end
    end
  end
end
