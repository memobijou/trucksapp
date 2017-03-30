require 'test_helper'

class OutgoingGoodsControllerTest < ActionController::TestCase
  setup do
    @outgoing_good = outgoing_goods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_goods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_good" do
    assert_difference('OutgoingGood.count') do
      post :create, outgoing_good: { delivery_note_number: @outgoing_good.delivery_note_number, request_number: @outgoing_good.request_number, truck_id: @outgoing_good.truck_id }
    end

    assert_redirected_to outgoing_good_path(assigns(:outgoing_good))
  end

  test "should show outgoing_good" do
    get :show, id: @outgoing_good
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outgoing_good
    assert_response :success
  end

  test "should update outgoing_good" do
    patch :update, id: @outgoing_good, outgoing_good: { delivery_note_number: @outgoing_good.delivery_note_number, request_number: @outgoing_good.request_number, truck_id: @outgoing_good.truck_id }
    assert_redirected_to outgoing_good_path(assigns(:outgoing_good))
  end

  test "should destroy outgoing_good" do
    assert_difference('OutgoingGood.count', -1) do
      delete :destroy, id: @outgoing_good
    end

    assert_redirected_to outgoing_goods_path
  end
end
