# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


[ { title: "The Great Gatsby", author: "F. Scott Fitzgerald", available: true, isbn: "9780743273565" },
  { title: "To Kill a Mockingbird", author: "Harper Lee", available: true, isbn: "9780061120084" },
  { title: "1984", author: "George Orwell", available: true, isbn: "9780451524935" },
  { title: "Pride and Prejudice", author: "Jane Austen", available: true, isbn: "9780679783268" },
  { title: "The Catcher in the Rye", author: "J.D. Salinger", available: true, isbn: "9780316769488" },
  { title: "The Hobbit", author: "J.R.R. Tolkien", available: true, isbn: "9780345339683" },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", available: true, isbn: "9780618640157" },
  { title: "Animal Farm", author: "George Orwell", available: true, isbn: "9780451526342" },
  { title: "Brave New World", author: "Aldous Huxley", available: true, isbn: "9780060850524" },
  { title: "The Grapes of Wrath", author: "John Steinbeck", available: true, isbn: "9780143039433" }
]. each do |book_attributes|
  Book.find_or_create_by!(book_attributes)
end