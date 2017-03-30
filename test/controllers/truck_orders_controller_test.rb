require 'test_helper'

class TruckOrdersControllerTest < ActionController::TestCase
  setup do
    @truck_order = truck_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truck_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck_order" do
    assert_difference('TruckOrder.count') do
      post :create, truck_order: { date: @truck_order.date }
    end

    assert_redirected_to truck_order_path(assigns(:truck_order))
  end

  test "should show truck_order" do
    get :show, id: @truck_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck_order
    assert_response :success
  end

  test "should update truck_order" do
    patch :update, id: @truck_order, truck_order: { date: @truck_order.date }
    assert_redirected_to truck_order_path(assigns(:truck_order))
  end

  test "should destroy truck_order" do
    assert_difference('TruckOrder.count', -1) do
      delete :destroy, id: @truck_order
    end

    assert_redirected_to truck_orders_path
  end
end
