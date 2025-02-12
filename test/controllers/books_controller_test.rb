require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
   @book = books(:one)
   @user = users(:one)
   log_in_as(@user)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get show" do
    book = Book.create(title: "Test Book", author: "Test Author", isbn: "TestISBN")
    get book_url(book)
    assert_equal "show", @controller.action_name
  end

  test "should get new" do
    post new_session_path, params: { email_address: @user.email_address, password: @user.password }
    get new_book_url
    assert_equal "new", @controller.action_name
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_equal "edit", @controller.action_name
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_path, params: { book: { title: "New Book", author: "New Author", isbn: "NewISBN" } }
    end

    assert_redirected_to book_url(Book.last)
  end


  test "should update book" do
    patch book_url(@book), params: { book: { title: "Updated Title" } }
    assert_redirected_to book_url(@book)
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  # test "should destroy book" do
  #   assert_difference("Book.count", -1) do
  #     delete book_url(@book)
  #   end

  #   assert_redirected_to books_url
  # end


  test "should borrow book" do
    post borrow_book_path(@book), params: { user_id: @user.id }
    assert_redirected_to books_url
  end


  test "should return book" do
    borrowed_book = BorrowedBook.create(user: @user, book: @book)

    post return_book_url(@book, borrowed_book)
    assert_redirected_to borrowed_books_url
  end
end
