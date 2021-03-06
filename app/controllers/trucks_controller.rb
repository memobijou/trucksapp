class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy, :complete]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
    @truck.build_incomming_good
    @truck.build_outgoing_good
    @truck.truck_employees.build
  end

  # GET /trucks/1/edit
  def edit
    @truck.truck_employees.build
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def complete
    @item.update_attribute(:completed_at, Time.now)
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:unitload, :numberpallets, :supplier, :licenseplate, :shippingagency, :occupied, :outgoing, :incoming, :claim, :completed, incomming_good_attributes: [:id , :ordernumber, :_destroy], outgoing_good_attributes: [:id , :request_number, :delivery_note_number , :_destroy], truck_employees_attributes: [:id , :employee_id, :_destroy])
    end
end 
