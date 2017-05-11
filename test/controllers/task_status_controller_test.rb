require 'test_helper'

class TaskStatusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_status_new_url
    assert_response :success
  end

  test "should get create" do
    get task_status_create_url
    assert_response :success
  end

  test "should get update" do
    get task_status_update_url
    assert_response :success
  end

  test "should get edit" do
    get task_status_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get task_status_destroy_url
    assert_response :success
  end

  test "should get show" do
    get task_status_show_url
    assert_response :success
  end

  test "should get index" do
    get task_status_index_url
    assert_response :success
  end

end
