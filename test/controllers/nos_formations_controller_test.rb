require 'test_helper'

class NosFormationsControllerTest < ActionDispatch::IntegrationTest
  test "should get nos_formations" do
    get nos_formations_nos_formations_url
    assert_response :success
  end

end
