Product.destroy_all
Category.destroy_all

NUMBER_OF_CATEGORIES = 5
PRODUCTS_PER_CATEGORY = 100

NUMBER_OF_CATEGORIES.times do
  category = Category.create(category_name: Faker::Food.unique.vegetables)

  PRODUCTS_PER_CATEGORY.times do
    product = category.products.create(
      product_name: Faker::FunnyName.unique.name,
      price:        rand(1.1..99.99),
      stock:        rand(1..100),
      description:  Faker::Food.description
    )
  end
end

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."

# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password",
#   password_confirmation: "password")
# end
