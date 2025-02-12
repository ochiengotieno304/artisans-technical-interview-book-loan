# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

10.times do
  Book.find_or_create_by!(title: Faker::Book.title, author: Faker::Book.author, isbn: Faker::Code.isbn, available: true)
end


User.find_or_create_by!(email_address: "test@example.com", password_digest: BCrypt::Password.create("password"))
