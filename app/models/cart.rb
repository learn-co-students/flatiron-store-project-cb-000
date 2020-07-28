class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  enum status: { submitted: 0, not_submitted: 1}
  def total
    items.sum(:price)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by_item_id(item_id)
    
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id)
    end

    line_item
  end
end
