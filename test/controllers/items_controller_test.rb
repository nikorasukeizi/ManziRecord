require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get items_top_url
    assert_response :success
  end

  test "should get show" do
    get items_show_url
    assert_response :success
  end

  test "should get index" do
    get items_index_url
    assert_response :success
  end

  test "should get search_result" do
    get items_search_result_url
    assert_response :success
  end

  test "should get ranking" do
    get items_ranking_url
    assert_response :success
  end

  test "should get new" do
    get items_new_url
    assert_response :success
  end

  test "should get edit" do
    get items_edit_url
    assert_response :success
  end

end
