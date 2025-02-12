require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new
    assert_not user.save
  end

  test "should save user with email and password" do
    user = User.new(email_address: "test@example.com", password: "testPassword")
    assert user.save
  end
end
