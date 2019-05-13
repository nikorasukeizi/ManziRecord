require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get artists_edit_url
    assert_response :success
  end

end
