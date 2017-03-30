class EmployeeVacationsController < ApplicationController
  before_action :set_employee_vacation, only: [:show, :edit, :update, :destroy]

  # GET /employee_vacations
  # GET /employee_vacations.json
  def index
    @employee_vacations = EmployeeVacation.all
  end

  # GET /employee_vacations/1
  # GET /employee_vacations/1.json
  def show
  end

  # GET /employee_vacations/new
  def new
    @employee_vacation = EmployeeVacation.new
  end

  # GET /employee_vacations/1/edit
  def edit
  end

  # POST /employee_vacations
  # POST /employee_vacations.json
  def create
    @employee_vacation = EmployeeVacation.new(employee_vacation_params)

    respond_to do |format|
      if @employee_vacation.save
        format.html { redirect_to @employee_vacation, notice: 'Employee vacation was successfully created.' }
        format.json { render :show, status: :created, location: @employee_vacation }
      else
        format.html { render :new }
        format.json { render json: @employee_vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_vacations/1
  # PATCH/PUT /employee_vacations/1.json
  def update
    respond_to do |format|
      if @employee_vacation.update(employee_vacation_params)
        format.html { redirect_to @employee_vacation, notice: 'Employee vacation was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_vacation }
      else
        format.html { render :edit }
        format.json { render json: @employee_vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_vacations/1
  # DELETE /employee_vacations/1.json
  def destroy
    @employee_vacation.destroy
    respond_to do |format|
      format.html { redirect_to employee_vacations_url, notice: 'Employee vacation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_vacation
      @employee_vacation = EmployeeVacation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_vacation_params
      params.require(:employee_vacation).permit(:employee_workinghour_id, :datum, :urlaub, employee_workinghour_attributes: [:id, :working_hour_id, :employee_id ,:_destroy])
    end
end
