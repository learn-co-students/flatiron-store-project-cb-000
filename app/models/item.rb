class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  scope :available_items, -> { where(inventory_is_greater_than_zero) }

  def self.inventory_is_greater_than_zero
    arel_table[:inventory].gt(0)
  end
end
