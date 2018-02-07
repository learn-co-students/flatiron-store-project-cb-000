10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

User.create(email: "mike@mikey.mike", password: "mikester")
User.create(email: "matt@matt.matt", password: "mattster")
User.create(email: "mish@mish.mish", password: "mishstress")

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end
