class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = 0
		self.line_items.each do |line_item|
			item = Item.find(line_item.item_id)
			total += item.price * line_item.quantity
		end
		total
	end

	def add_item(item_id)
		line_item = self.line_items.find_by(item_id: item_id)
		if line_item
			line_item.quantity += 1
		else
			line_item = self.line_items.new(quantity: 1, item_id: item_id)
		end
		line_item
	end

	def remove_item(item_id)
		line_item = self.line_items.find_by(item_id: item_id)
		item = Item.find(item_id)
		if line_item && line_item.quantity > 0
			item.inventory -= line_item.quantity
			item.save
			line_item.quantity -= 0
		end
	end

end
