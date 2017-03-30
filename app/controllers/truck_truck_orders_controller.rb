class TruckTruckOrdersController < ApplicationController
  before_action :set_truck_truck_order, only: [:show, :edit, :update, :destroy]

  # GET /truck_truck_orders
  # GET /truck_truck_orders.json
  def index
    @truck_truck_orders = TruckTruckOrder.all
  end

  # GET /truck_truck_orders/1
  # GET /truck_truck_orders/1.json
  def show
  end

  # GET /truck_truck_orders/new
  def new
    @truck_truck_order = TruckTruckOrder.new
    @truck_truck_order.build_truck
    @truck_truck_order.build_truck_order
    @truck_truck_order.truck.build_incomming_good
    @truck_truck_order.truck.build_outgoing_good
    @truck_truck_order.truck.truck_employees.build
    
    if @truck_truck_order.truck_id == nil
      @truck_truck_order = nil
    end
  end

  # GET /truck_truck_orders/1/edit
  def edit
    @truck_truck_order.truck.truck_employees.build
    @truck_truck_order.build_truck
    @truck_truck_order.build_truck_order
    @truck_truck_order.truck.build_incomming_good
    @truck_truck_order.truck.build_outgoing_good
    @truck_truck_order.truck.truck_employees.build
    
    if @truck_truck_order.truck_id == nil
      @truck_truck_order = nil
    end
  end

  # POST /truck_truck_orders
  # POST /truck_truck_orders.json
  def create
    @truck_truck_order = TruckTruckOrder.new(truck_truck_order_params)
    if @truck_truck_order.truck_id != nil

    respond_to do |format|
      if @truck_truck_order.save
        format.html { redirect_to @truck_truck_order, notice: 'Truck truck order was successfully created.' }
        format.json { render :show, status: :created, location: @truck_truck_order }
      else
        format.html { render :new }
        format.json { render json: @truck_truck_order.errors, status: :unprocessable_entity }
      end
    end  
    end
  end

  # PATCH/PUT /truck_truck_orders/1
  # PATCH/PUT /truck_truck_orders/1.json
  def update
    respond_to do |format|
      

      if @truck_truck_order.update(truck_truck_order_params)
        format.html { redirect_to @truck_truck_order, notice: 'Truck truck order was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_truck_order }
      else
        format.html { render :edit }
        format.json { render json: @truck_truck_order.errors, status: :unprocessable_entity }
      end
  end
  end

  # DELETE /truck_truck_orders/1
  # DELETE /truck_truck_orders/1.json
  def destroy
    @truck_truck_order.destroy
    respond_to do |format|
      format.html { redirect_to truck_truck_orders_url, notice: 'Truck truck order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_truck_order
      @truck_truck_order = TruckTruckOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_truck_order_params
      params.require(:truck_truck_order).permit(:truck_id, :truck_order_id, :time, truck_attributes: [:id ,:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :_destroy, truck_employees_attributes: [:id , :employee_id, :_destroy], incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy]], truck_order_attributes: [:id ,:date])
    end
end
