class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	
	
	def self.available_items
	  self.all.collect do |item|
		  if !item.inventory.zero? && !item.inventory.nil?
				item
			end
		end.compact 
	end 
end

