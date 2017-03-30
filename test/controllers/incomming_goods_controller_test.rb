require 'test_helper'

class IncommingGoodsControllerTest < ActionController::TestCase
  setup do
    @incomming_good = incomming_goods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incomming_goods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incomming_good" do
    assert_difference('IncommingGood.count') do
      post :create, incomming_good: { ordernumber: @incomming_good.ordernumber, truck_id: @incomming_good.truck_id }
    end

    assert_redirected_to incomming_good_path(assigns(:incomming_good))
  end

  test "should show incomming_good" do
    get :show, id: @incomming_good
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incomming_good
    assert_response :success
  end

  test "should update incomming_good" do
    patch :update, id: @incomming_good, incomming_good: { ordernumber: @incomming_good.ordernumber, truck_id: @incomming_good.truck_id }
    assert_redirected_to incomming_good_path(assigns(:incomming_good))
  end

  test "should destroy incomming_good" do
    assert_difference('IncommingGood.count', -1) do
      delete :destroy, id: @incomming_good
    end

    assert_redirected_to incomming_goods_path
  end
end
