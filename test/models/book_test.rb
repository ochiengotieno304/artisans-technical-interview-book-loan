require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new
    assert_not book.save
  end

  test "should not save book without author" do
    book = Book.new
    assert_not book.save
  end

  test "should not save book without isbn" do
    book = Book.new
    assert_not book.save
  end

  test "should have unique isbn" do
    Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565")
    book2 = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565")
    assert_not book2.save
  end

  test "should save book with title, author & isbn" do
    book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565")
    assert book.save
  end
end
