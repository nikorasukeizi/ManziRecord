require 'test_helper'

class BuyInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get complete" do
    get buy_infos_complete_url
    assert_response :success
  end

  test "should get index" do
    get buy_infos_index_url
    assert_response :success
  end

  test "should get show" do
    get buy_infos_show_url
    assert_response :success
  end

  test "should get edit" do
    get buy_infos_edit_url
    assert_response :success
  end

end
