require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { contents: @schedule.contents, end_time: @schedule.end_time, id: @schedule.id, kick_date: @schedule.kick_date, open_flag: @schedule.open_flag, register: @schedule.register, start_time: @schedule.start_time, title: @schedule.title }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    put :update, id: @schedule, schedule: { contents: @schedule.contents, end_time: @schedule.end_time, id: @schedule.id, kick_date: @schedule.kick_date, open_flag: @schedule.open_flag, register: @schedule.register, start_time: @schedule.start_time, title: @schedule.title }
    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
