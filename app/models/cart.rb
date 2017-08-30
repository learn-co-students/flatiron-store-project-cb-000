class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :dependent => :destroy
  has_many :items, through: :line_items

  #create new unsaved line_item for new item
  #updates existing line_item instead of making new when adding same item
  def add_item(item)
    line_item = self.line_items.find_by(item_id: item.to_i)
    if line_item
      line_item.quantity += 1
    else
      #build a new line item associated with current cart
      line_item = self.line_items.build(item_id: item)
    end
    line_item
  end

  #caculates total of all items in cart
  def total
    #(0) means if items it returns 0 instead of nil
    # can't just use :+ because item is object
    line_items.inject(0){ |sum, line_item| sum += (line_item.item.price * line_item.quantity)}
  end

  def checkout
    if self.update(status: 'submitted')
        takeout_inventory
        user.rest_current_cart
    end
  end

  def create_current_cart
    cart = carts.create
    update(:current_cart_id => cart.id)
  end

  private

  def takeout_inventory
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end

end
