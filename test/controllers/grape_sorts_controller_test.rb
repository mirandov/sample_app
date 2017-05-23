require 'test_helper'

class GrapeSortsControllerTest < ActionController::TestCase
  setup do
    @grape_sort = grape_sorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grape_sorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grape_sort" do
    assert_difference('GrapeSort.count') do
      post :create, grape_sort: { date_of_collection: @grape_sort.date_of_collection, name: @grape_sort.name, place_of_growth: @grape_sort.place_of_growth }
    end

    assert_redirected_to grape_sort_path(assigns(:grape_sort))
  end

  test "should show grape_sort" do
    get :show, id: @grape_sort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grape_sort
    assert_response :success
  end

  test "should update grape_sort" do
    patch :update, id: @grape_sort, grape_sort: { date_of_collection: @grape_sort.date_of_collection, name: @grape_sort.name, place_of_growth: @grape_sort.place_of_growth }
    assert_redirected_to grape_sort_path(assigns(:grape_sort))
  end

  test "should destroy grape_sort" do
    assert_difference('GrapeSort.count', -1) do
      delete :destroy, id: @grape_sort
    end

    assert_redirected_to grape_sorts_path
  end
end
