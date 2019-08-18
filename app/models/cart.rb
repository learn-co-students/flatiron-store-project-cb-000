class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  def total
    total_price = 0
    line_items.each do |line_item|
      total_price += line_item.quantity * line_item.item.price
    end
    total_price
  end

  def add_item(item_id)
    @item = Item.find(item_id)
    @line_item = line_items.find_by(item: @item)
    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = line_items.new(quantity: 1, item: @item)
    end
    @line_item
  end
end
