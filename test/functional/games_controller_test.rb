require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "should get pickquestion" do
    get :pickquestion
    assert_response :success
  end

  test "should get answerquestion" do
    get :answerquestion
    assert_response :success
  end

end
