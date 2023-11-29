require "test_helper"

class GithubFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get github_form_index_url
    assert_response :success
  end
end
