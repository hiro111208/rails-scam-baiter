require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get themes" do
    get themes_themes_url
    assert_response :success
  end

end
