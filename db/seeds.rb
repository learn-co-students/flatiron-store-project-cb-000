10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number,
    price: Faker::Number.number
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end
User.create(email:"erikku@kuraputon.com",password:"11111111",password_confirmation:"11111111")
