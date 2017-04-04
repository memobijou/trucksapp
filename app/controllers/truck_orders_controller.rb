class TruckOrdersController < ApplicationController
  before_action :set_truck_order, only: [:show, :edit, :update, :destroy]

  # GET /truck_orders
  # GET /truck_orders.json
  def index
    if params[:commit] == "Filter"
          date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
          if params[:case] == 'week' 
          @truck_orders = TruckOrder.where(date: [date, date+1, date+2, date+3, date+4, date+5, date+6])
          elsif params[:case] == 'month' 
          @truck_orders = TruckOrder.where("strftime('%m', date) = ?", date.strftime('%m'))
          elsif params[:case] == 'day'
          @truck_orders = TruckOrder.where(date: [date])
          elsif params[:case] == 'year' 
          @truck_orders = TruckOrder.where("strftime('%Y', date) = ?", date.strftime('%Y'))
          end
      return
    end  
    
   
    
    @truck_orders = TruckOrder.all
  end
  
  def get_inouts
     ## WOCHENANSICHT ANZAHL INCOMING OUTGOING
    
    datex = Date.today    # HIER WILL ICH AUF PARAMS ZU GREIFEN WAS VON JAVASCRIPT ERZEUGT WIRD
    
    dates = TruckOrder.where(date: [datex, datex+1, datex+2, datex+3, datex+4, datex+5, datex+6]).pluck(:date, :id)
    @trucks = []
    dates.each do |date|
    @trucks  << TruckTruckOrder.where(:truck_order_id => date[1]).pluck(:truck_id)
    end
    @inouts = []
    @trucks.each do |truck|
      @inouts << Truck.find(truck[0]).incoming
    end  
    @incomings = 0
    @outgoings = 0
    @inouts.each do |inout|
      if inout.to_s == "true"
        @incomings = @incomings + 1
      else  
        @outgoings = @outgoings + 1
      end  
    end  
    
    return incomings    

    #########################################
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
    #@truck_order = TruckOrder.new(truck_order_params)
    
    
      @length = params[:truck_order][:truck_truck_orders_attributes].length
        @debug = []
        params[:truck_order][:truck_truck_orders_attributes].each do |key, value|
        
        
            @debug << key.to_s
            @i = value[:truck_attributes][:incoming].to_s
            @o = value[:truck_attributes][:outgoing].to_s
            
            
            if @i == "1" && @o == "1"
              flash[:error] = "DOUBLE CHECKED!"
              redirect_to :back
              return
            end  
            
            if @i == "0" && @o == "0"
              flash[:error] = "NOT CHECKED!"
              redirect_to :back
              return
            end  
            
             if key == (@length-1).to_s
              if @i == "1" || @o == "1" 
                @unitload = value[:truck_attributes][:unitload].to_s
                @numberpallets = value[:truck_attributes][:numberpallets].to_s
                @new_truck_id = value[:truck_attributes][:id]
              if @numberpallets == ""
                  truck_order_params
                  @truck_order_params[:truck_truck_orders_attributes]["0"][:truck_attributes][:numberpallets] = "0"
              end
              
              if @unitload == ""
                  truck_order_params
                  @truck_order_params[:truck_truck_orders_attributes]["0"][:truck_attributes][:unitload] = "0"
              end
              

              
              end  
            end  
            

        end
        
    @truck_order = TruckOrder.new(truck_order_params)
    
    respond_to do |format|
      if @truck_order.save
         #@truck_order.truck_truck_orders.where(truck_id: nil).delete_all
       
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
        @length = params[:truck_order][:truck_truck_orders_attributes].length
        @debug = []
        params[:truck_order][:truck_truck_orders_attributes].each do |key, value|
        if  value[:truck_attributes] && value[:truck_attributes][:id].to_s != ""
            if value[:truck_attributes][:completed].to_s == "" or value[:truck_attributes][:completed].to_s == "0"  && Truck.find(value[:truck_attributes][:id]).completed == "true" 
              Truck.find(value[:truck_attributes][:id]).update_attribute(:completed, 0)
            end
            
            if Truck.find(value[:truck_attributes][:id]).completed.to_s == "false" || Truck.find(value[:truck_attributes][:id]).completed.to_s == "" &&  value[:truck_attributes][:completed].to_s == "1"
              Truck.find(value[:truck_attributes][:id]).update_attribute(:completed, true)
              Truck.find(value[:truck_attributes][:id]).update_attribute(:completed_at, Time.now)
            end
            #abort(@debug.to_s)
            
        end    
            if value[:truck_attributes]
            @i = value[:truck_attributes][:incoming].to_s
            @o = value[:truck_attributes][:outgoing].to_s
            
            if @i == "1" && @o == "1"
              flash[:error] = "DOUBLE CHECKED!"
              redirect_to :back
              return
            end  
            
            if @i == "0" && @o == "0" && key != (@length-1).to_s
              flash[:error] = "NOT CHECKED!"
              redirect_to :back
              return
            end
             
            if key.to_s == (@length-1).to_s
              @unitload = value[:truck_attributes][:unitload].to_s
              @numberpallets = value[:truck_attributes][:numberpallets].to_s
             if value[:truck_attributes][:incoming].to_s == "1" or value[:truck_attributes][:outgoing].to_s == "1"
              if @numberpallets == ""
                  truck_order_params
                  @truck_order_params[:truck_truck_orders_attributes][key.to_s][:truck_attributes][:numberpallets] = "0"
              end
              
              if @unitload == ""
                  truck_order_params
                  @truck_order_params[:truck_truck_orders_attributes][key.to_s][:truck_attributes][:unitload] = "0"
              end
            end
            end  
           
          end
        end

      
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
    @truck_order_params ||= params.require(:truck_order).permit(:truck_order_id ,:date, :_destroy, truck_truck_orders_attributes: [:id, :truck_id, :time, :notes, truck_attributes: [:id ,:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :claim, :incoming, :outgoing, :ordernumber, :request_number, :delivery_note_number, :completed_at, :completed, :_destroy, truck_employees_attributes: [:id , :employee_id, :_destroy], incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy]]])
    end
end 
# truck_attributes: [:id ,:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :_destroy, truck_employees_attributes: [:id , :employee_id, :_destroy], incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy]]