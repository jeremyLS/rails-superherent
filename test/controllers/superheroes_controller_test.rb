require 'test_helper'

class SuperheroesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get superheroes_show_url
    assert_response :success
  end

end
