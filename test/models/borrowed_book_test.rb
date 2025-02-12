require "test_helper"

class BorrowedBookTest < ActiveSupport::TestCase
  test "should not save borrowed book without user" do
    borrowed_book = BorrowedBook.new
    assert_not borrowed_book.save
  end

  test "should not save borrowed book without book" do
    borrowed_book = BorrowedBook.new
    assert_not borrowed_book.save
  end

  test "should not save borrowed book without due date" do
    borrowed_book = BorrowedBook.new
    assert_not borrowed_book.save
  end

  test "should save borrowed book with user, book and due date" do
    user = User.create(email_address: "test@mail.com", password: "password")
    book = Book.create(title: "Test Book", author: "author", isbn: "03498357-1")
    borrowed_book = BorrowedBook.new(user: user, book: book, due_date: Date.today)
    assert borrowed_book.save
  end

  test "should not save borrowed book with same user and book" do
    user = User.create(email_address: "test@mail.com", password: "password")
    book = Book.create(title: "Test Book", author: "author", isbn: "03498357-1")
    BorrowedBook.create(user: user, book: book, due_date: Date.today)
    borrowed_book = BorrowedBook.new(user: user, book: book, due_date: Date.today)

    assert_not borrowed_book.save
  end
end
