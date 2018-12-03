module CategoriesHelper
  def add_to_cart(item)
    if user_signed_in?
      render partial: 'add_to_cart', locals: { item: item }
    end
  end
end