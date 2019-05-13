require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get ranking" do
    get genres_ranking_url
    assert_response :success
  end

  test "should get edit" do
    get genres_edit_url
    assert_response :success
  end

end
