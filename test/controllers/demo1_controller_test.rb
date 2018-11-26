require 'test_helper'

class Demo1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demo1_index_url
    assert_response :success
  end

end
