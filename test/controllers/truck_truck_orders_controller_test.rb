require 'test_helper'

class TruckTruckOrdersControllerTest < ActionController::TestCase
  setup do
    @truck_truck_order = truck_truck_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truck_truck_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck_truck_order" do
    assert_difference('TruckTruckOrder.count') do
      post :create, truck_truck_order: { time: @truck_truck_order.time, truck_id: @truck_truck_order.truck_id, truck_order_id: @truck_truck_order.truck_order_id }
    end

    assert_redirected_to truck_truck_order_path(assigns(:truck_truck_order))
  end

  test "should show truck_truck_order" do
    get :show, id: @truck_truck_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck_truck_order
    assert_response :success
  end

  test "should update truck_truck_order" do
    patch :update, id: @truck_truck_order, truck_truck_order: { time: @truck_truck_order.time, truck_id: @truck_truck_order.truck_id, truck_order_id: @truck_truck_order.truck_order_id }
    assert_redirected_to truck_truck_order_path(assigns(:truck_truck_order))
  end

  test "should destroy truck_truck_order" do
    assert_difference('TruckTruckOrder.count', -1) do
      delete :destroy, id: @truck_truck_order
    end

    assert_redirected_to truck_truck_orders_path
  end
end
