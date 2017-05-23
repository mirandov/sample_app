require 'test_helper'

class WineSortsControllerTest < ActionController::TestCase
  setup do
    @wine_sort = wine_sorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wine_sorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine_sort" do
    assert_difference('WineSort.count') do
      post :create, wine_sort: { barrel_extract: @wine_sort.barrel_extract, bottle_extract: @wine_sort.bottle_extract, color: @wine_sort.color, name: @wine_sort.name, type_of_wine: @wine_sort.type_of_wine }
    end

    assert_redirected_to wine_sort_path(assigns(:wine_sort))
  end

  test "should show wine_sort" do
    get :show, id: @wine_sort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine_sort
    assert_response :success
  end

  test "should update wine_sort" do
    patch :update, id: @wine_sort, wine_sort: { barrel_extract: @wine_sort.barrel_extract, bottle_extract: @wine_sort.bottle_extract, color: @wine_sort.color, name: @wine_sort.name, type_of_wine: @wine_sort.type_of_wine }
    assert_redirected_to wine_sort_path(assigns(:wine_sort))
  end

  test "should destroy wine_sort" do
    assert_difference('WineSort.count', -1) do
      delete :destroy, id: @wine_sort
    end

    assert_redirected_to wine_sorts_path
  end
end
