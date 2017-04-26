class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items
	belongs_to :user

	def total
		self.line_items.collect{|line_item| line_item.item.price*line_item.quantity}.sum
	end

	def add_item(item_id)
		item = Item.find(item_id)
		if self.items.include?(item)
			line_item = self.line_items.find_by(item_id: item_id)
			line_item.quantity += 1
			line_item.save
		else
			line_item = self.line_items.build(item_id: item_id)
		end
		line_item
	end

	def checkout
		self.items.each do |item|
			item.inventory -= self.line_items.find_by(item_id: item.id).quantity
			item.save
		end
	end

end
