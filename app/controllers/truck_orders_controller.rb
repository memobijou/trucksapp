class TruckOrdersController < ApplicationController
  before_action :set_truck_order, only: [:show, :edit, :update, :destroy]

  # GET /truck_orders
  # GET /truck_orders.json
  def index
    if params[:commit] == "Filter"
          date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
          @truck_orders = TruckOrder.where(:date => date)

      return
    end  
    @truck_orders = TruckOrder.all
  end

  # GET /truck_orders/1
  # GET /truck_orders/1.json
  def show
  end

  # GET /truck_orders/new
  def new
    @truck_order = TruckOrder.new
    
    @truck_order.truck_truck_orders.build
    @truck_order.truck_truck_orders.each do |to|
        to.build_truck
        to.truck.build_incomming_good
        to.truck.build_outgoing_good
        to.truck.truck_employees.build
      end
    
   

  end

  # GET /truck_orders/1/edit
  def edit
    @truck_order.truck_truck_orders.build
    @a = 0
    @b = 0

    @truck_order.truck_truck_orders.each do |to|
            if to == @truck_order.truck_truck_orders.last
              @a = @a + 1
              to.build_truck
              to.truck.build_incomming_good
              to.truck.build_outgoing_good
              to.truck.truck_employees.build
            end
             if to != @truck_order.truck_truck_orders.last
              @b = @b + 1            

              begin
                 to.truck.truck_employees.build
                 to.truck.build_incomming_good
                 to.truck.build_outgoing_good
              rescue => ex
                logger.error ex.message
              end
                
              
                
             
             end
    end


  end
   

    
 

  

  # POST /truck_orders
  # POST /truck_orders.json
  def create

    @truck_order = TruckOrder.new(truck_order_params)
   
    respond_to do |format|
      if @truck_order.save
        format.html { redirect_to @truck_order, notice: 'Truck order was successfully created.' }
        format.json { render :show, status: :created, location: @truck_order }
      else
        format.html { render :new }
        format.json { render json: @truck_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck_orders/1
  # PATCH/PUT /truck_orders/1.json
  def update

    
    respond_to do |format|
      if @truck_order.update(truck_order_params)
        @truck_order.truck_truck_orders.where(truck_id: nil).delete_all
        format.html { redirect_to @truck_order, notice: 'Truck order was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_order }
      else
        format.html { render :edit }
        format.json { render json: @truck_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck_orders/1
  # DELETE /truck_orders/1.json
  def destroy
    @truck_order.destroy
    respond_to do |format|
      format.html { redirect_to truck_orders_url, notice: 'Truck order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_order
      @truck_order = TruckOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_order_params
      params.require(:truck_order).permit(:truck_order_id ,:date, :_destroy, truck_truck_orders_attributes: [:id, :truck_id, :time, truck_attributes: [:id ,:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :incoming, :outgoing, :ordernumber, :request_number, :delivery_note_number, :_destroy, truck_employees_attributes: [:id , :employee_id, :_destroy], incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy]]])
    end
end 
# truck_attributes: [:id ,:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :_destroy, truck_employees_attributes: [:id , :employee_id, :_destroy], incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy]]