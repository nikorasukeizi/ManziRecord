require 'test_helper'

class ArtistsLabelsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get artists_labels_genres_new_url
    assert_response :success
  end

  test "should get index" do
    get artists_labels_genres_index_url
    assert_response :success
  end

end
