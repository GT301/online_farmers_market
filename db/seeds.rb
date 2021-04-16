Product.destroy_all
Category.destroy_all

NUMBER_OF_CATEGORIES = 5
PRODUCTS_PER_CATEGORY = 100

NUMBER_OF_CATEGORIES.times do
  category = Category.create(category_name: Faker::Food.unique.vegetables)

  PRODUCTS_PER_CATEGORY.times do
    product = category.products.create(
      product_name: Faker::FunnyName.unique.name,
      price:        Faker::Commerce.price,
      stock:        rand(1..100),
      description:  Faker::Food.description
    )
    query = URI.encode_www_form_component([product.product_name, category.category_name].join(","))

    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")

    product.image.attach(io:       downloaded_image,
                         filename: "m-#{[product.product_name,
                                         category.category_name].join('-')}.jpg")
    sleep(0.5)
  end
end

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."

# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password",
#   password_confirmation: "password")
# end
