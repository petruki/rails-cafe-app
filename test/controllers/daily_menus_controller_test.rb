require "test_helper"

class DailyMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_menus_index_url
    assert_response :success
  end

  test "should get new" do
    get daily_menus_new_url
    assert_response :success
  end

  test "should get create" do
    get daily_menus_create_url
    assert_response :success
  end

  test "should get show" do
    get daily_menus_show_url
    assert_response :success
  end

  test "should get edit" do
    get daily_menus_edit_url
    assert_response :success
  end

  test "should get update" do
    get daily_menus_update_url
    assert_response :success
  end

  test "should get destroy" do
    get daily_menus_destroy_url
    assert_response :success
  end
end
