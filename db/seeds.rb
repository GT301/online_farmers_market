Product.destroy_all
Category.destroy_all

categ = Category.create(category_name: "Crops")
prod = categ.products.create(product_name: "corn", price: 0.99, stock: 23)

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."

# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password",
#   password_confirmation: "password")
# end
