10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

counter = 1
10.times do
  User.create(email: "testtest#{counter}", password: "testtest#{counter}", password_confirmation: "testtest#{counter}")
  counter += 1
end
