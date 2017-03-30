require 'test_helper'

class TruckEmployeesControllerTest < ActionController::TestCase
  setup do
    @truck_employee = truck_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truck_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck_employee" do
    assert_difference('TruckEmployee.count') do
      post :create, truck_employee: { employee_id: @truck_employee.employee_id, truck_id: @truck_employee.truck_id }
    end

    assert_redirected_to truck_employee_path(assigns(:truck_employee))
  end

  test "should show truck_employee" do
    get :show, id: @truck_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck_employee
    assert_response :success
  end

  test "should update truck_employee" do
    patch :update, id: @truck_employee, truck_employee: { employee_id: @truck_employee.employee_id, truck_id: @truck_employee.truck_id }
    assert_redirected_to truck_employee_path(assigns(:truck_employee))
  end

  test "should destroy truck_employee" do
    assert_difference('TruckEmployee.count', -1) do
      delete :destroy, id: @truck_employee
    end

    assert_redirected_to truck_employees_path
  end
end
