require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get registrations_edit_url
    assert_response :success
  end

end
