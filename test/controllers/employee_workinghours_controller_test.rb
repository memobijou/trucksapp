require 'test_helper'

class EmployeeWorkinghoursControllerTest < ActionController::TestCase
  setup do
    @employee_workinghour = employee_workinghours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_workinghours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_workinghour" do
    assert_difference('EmployeeWorkinghour.count') do
      post :create, employee_workinghour: { employee_id: @employee_workinghour.employee_id, working_hour_id: @employee_workinghour.working_hour_id }
    end

    assert_redirected_to employee_workinghour_path(assigns(:employee_workinghour))
  end

  test "should show employee_workinghour" do
    get :show, id: @employee_workinghour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_workinghour
    assert_response :success
  end

  test "should update employee_workinghour" do
    patch :update, id: @employee_workinghour, employee_workinghour: { employee_id: @employee_workinghour.employee_id, working_hour_id: @employee_workinghour.working_hour_id }
    assert_redirected_to employee_workinghour_path(assigns(:employee_workinghour))
  end

  test "should destroy employee_workinghour" do
    assert_difference('EmployeeWorkinghour.count', -1) do
      delete :destroy, id: @employee_workinghour
    end

    assert_redirected_to employee_workinghours_path
  end
end
