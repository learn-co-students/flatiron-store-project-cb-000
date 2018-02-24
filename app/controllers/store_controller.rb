class StoreController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		@categories = Category.all
		@items = Item.available_items
	end
end
