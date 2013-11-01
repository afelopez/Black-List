require 'test_helper'

class RegionesControllerTest < ActionController::TestCase
  test "should get regiones" do
    get :regiones
    assert_response :success
  end

end
