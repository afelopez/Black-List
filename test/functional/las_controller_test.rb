require 'test_helper'

class LasControllerTest < ActionController::TestCase
  setup do
    @la = las(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:las)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create la" do
    assert_difference('La.count') do
      post :create, la: { detail: @la.detail, reason: @la.reason, summoner: @la.summoner, types: @la.types }
    end

    assert_redirected_to la_path(assigns(:la))
  end

  test "should show la" do
    get :show, id: @la
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @la
    assert_response :success
  end

  test "should update la" do
    put :update, id: @la, la: { detail: @la.detail, reason: @la.reason, summoner: @la.summoner, types: @la.types }
    assert_redirected_to la_path(assigns(:la))
  end

  test "should destroy la" do
    assert_difference('La.count', -1) do
      delete :destroy, id: @la
    end

    assert_redirected_to las_path
  end
end
