require "test_helper"

class MaintenanceServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get maintenance_service_create_url
    assert_response :success
  end
end
