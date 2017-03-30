require 'test_helper'

class EmployeeVacationsControllerTest < ActionController::TestCase
  setup do
    @employee_vacation = employee_vacations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_vacations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_vacation" do
    assert_difference('EmployeeVacation.count') do
      post :create, employee_vacation: { datum: @employee_vacation.datum, employee_workinghour_id: @employee_vacation.employee_workinghour_id, urlaub: @employee_vacation.urlaub }
    end

    assert_redirected_to employee_vacation_path(assigns(:employee_vacation))
  end

  test "should show employee_vacation" do
    get :show, id: @employee_vacation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_vacation
    assert_response :success
  end

  test "should update employee_vacation" do
    patch :update, id: @employee_vacation, employee_vacation: { datum: @employee_vacation.datum, employee_workinghour_id: @employee_vacation.employee_workinghour_id, urlaub: @employee_vacation.urlaub }
    assert_redirected_to employee_vacation_path(assigns(:employee_vacation))
  end

  test "should destroy employee_vacation" do
    assert_difference('EmployeeVacation.count', -1) do
      delete :destroy, id: @employee_vacation
    end

    assert_redirected_to employee_vacations_path
  end
end
