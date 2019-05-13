require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get labels_edit_url
    assert_response :success
  end

end
