class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item)
    if line_item
      line_item.quantity += 1
      line_item.save
      line_item
    else
      self.line_items.new(quantity: 1, item_id: item)
    end
  end
end

#   describe "#add_item" do
#     it 'creates a new unsaved line_item for new item' do
#       second_item = Item.second
#       second_line_item = @cart.add_item(second_item.id)
#       expect(second_line_item.new_record?).to be_truthy
#     end
#
#     it 'creates an appropriate line_item' do
#       second_item = Item.second
#       second_line_item = @cart.add_item(second_item.id)
#       expect(second_line_item.quantity).to eq(1)
#       expect(second_line_item.item_id).to eq(second_item.id)
#       expect(second_line_item.cart_id).to eq(@cart.id)
#     end
