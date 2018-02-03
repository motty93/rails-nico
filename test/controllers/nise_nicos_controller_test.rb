require 'test_helper'

class NiseNicoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nise_nico_index_url
    assert_response :success
  end

end
