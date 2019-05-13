require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get buy_history" do
    get users_buy_history_url
    assert_response :success
  end

  test "should get withdraw_view" do
    get users_withdraw_view_url
    assert_response :success
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get cart_show" do
    get users_cart_show_url
    assert_response :success
  end

  test "should get buy" do
    get users_buy_url
    assert_response :success
  end

  test "should get buy_confirm" do
    get users_buy_confirm_url
    assert_response :success
  end

end
