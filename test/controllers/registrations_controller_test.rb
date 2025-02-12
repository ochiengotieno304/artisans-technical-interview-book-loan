require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should not get new if authenticated" do
    user = User.create(email_address: "test@mail.com", password: "password")
    post session_url(email_address: user.email_address, password: "password")
    get new_registration_url
    assert_redirected_to root_url
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post registration_url, params: { email_address: "test@mail.com", password: "password" }
    end

    assert_redirected_to root_url
  end
end
