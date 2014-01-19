require 'test_helper'

class AttendanceListsControllerTest < ActionController::TestCase
  setup do
    @attendance_list = attendance_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_list" do
    assert_difference('AttendanceList.count') do
      post :create, attendance_list: { comment: @attendance_list.comment, id: @attendance_list.id, member_id: @attendance_list.member_id, schedule_id: @attendance_list.schedule_id, status: @attendance_list.status }
    end

    assert_redirected_to attendance_list_path(assigns(:attendance_list))
  end

  test "should show attendance_list" do
    get :show, id: @attendance_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_list
    assert_response :success
  end

  test "should update attendance_list" do
    put :update, id: @attendance_list, attendance_list: { comment: @attendance_list.comment, id: @attendance_list.id, member_id: @attendance_list.member_id, schedule_id: @attendance_list.schedule_id, status: @attendance_list.status }
    assert_redirected_to attendance_list_path(assigns(:attendance_list))
  end

  test "should destroy attendance_list" do
    assert_difference('AttendanceList.count', -1) do
      delete :destroy, id: @attendance_list
    end

    assert_redirected_to attendance_lists_path
  end
end
