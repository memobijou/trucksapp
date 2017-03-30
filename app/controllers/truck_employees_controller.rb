class TruckEmployeesController < ApplicationController
  before_action :set_truck_employee, only: [:show, :edit, :update, :destroy]

  # GET /truck_employees
  # GET /truck_employees.json
  def index
    @truck_employees = TruckEmployee.all
  end

  # GET /truck_employees/1
  # GET /truck_employees/1.json
  def show
  end

  # GET /truck_employees/new
  def new
    @truck_employee = TruckEmployee.new
    @truck_employee.build_employee
  end

  # GET /truck_employees/1/edit
  def edit
  end

  # POST /truck_employees
  # POST /truck_employees.json
  def create
    @truck_employee = TruckEmployee.new(truck_employee_params)

    respond_to do |format|
      if @truck_employee.save
        format.html { redirect_to @truck_employee, notice: 'Truck employee was successfully created.' }
        format.json { render :show, status: :created, location: @truck_employee }
      else
        format.html { render :new }
        format.json { render json: @truck_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck_employees/1
  # PATCH/PUT /truck_employees/1.json
  def update
    respond_to do |format|
      if @truck_employee.update(truck_employee_params)
        format.html { redirect_to @truck_employee, notice: 'Truck employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_employee }
      else
        format.html { render :edit }
        format.json { render json: @truck_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck_employees/1
  # DELETE /truck_employees/1.json
  def destroy
    @truck_employee.destroy
    respond_to do |format|
      format.html { redirect_to truck_employees_url, notice: 'Truck employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_employee
      @truck_employee = TruckEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_employee_params
      params.require(:truck_employee).permit(:truck_id, :employee_id)
    end
end
