require 'test_helper'

class EmployeeSupervisorsControllerTest < ActionController::TestCase
  setup do
    @employee_supervisor = employee_supervisors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_supervisors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_supervisor" do
    assert_difference('EmployeeSupervisor.count') do
      post :create, employee_supervisor: { employee_id: @employee_supervisor.employee_id, priority: @employee_supervisor.priority, supervisor_id: @employee_supervisor.supervisor_id }
    end

    assert_redirected_to employee_supervisor_path(assigns(:employee_supervisor))
  end

  test "should show employee_supervisor" do
    get :show, id: @employee_supervisor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_supervisor
    assert_response :success
  end

  test "should update employee_supervisor" do
    patch :update, id: @employee_supervisor, employee_supervisor: { employee_id: @employee_supervisor.employee_id, priority: @employee_supervisor.priority, supervisor_id: @employee_supervisor.supervisor_id }
    assert_redirected_to employee_supervisor_path(assigns(:employee_supervisor))
  end

  test "should destroy employee_supervisor" do
    assert_difference('EmployeeSupervisor.count', -1) do
      delete :destroy, id: @employee_supervisor
    end

    assert_redirected_to employee_supervisors_path
  end
end
