class EmployeeSupervisorsController < ApplicationController
  before_action :set_employee_supervisor, only: [:show, :edit, :update, :destroy]

  # GET /employee_supervisors
  # GET /employee_supervisors.json
  def index
    @employee_supervisors = EmployeeSupervisor.all
  end

  # GET /employee_supervisors/1
  # GET /employee_supervisors/1.json
  def show
  end

  # GET /employee_supervisors/new
  def new
    @employee_supervisor = EmployeeSupervisor.new
  end

  # GET /employee_supervisors/1/edit
  def edit
  end

  # POST /employee_supervisors
  # POST /employee_supervisors.json
  def create
    @employee_supervisor = EmployeeSupervisor.new(employee_supervisor_params)

    respond_to do |format|
      if @employee_supervisor.save
        format.html { redirect_to @employee_supervisor, notice: 'Employee supervisor was successfully created.' }
        format.json { render :show, status: :created, location: @employee_supervisor }
      else
        format.html { render :new }
        format.json { render json: @employee_supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_supervisors/1
  # PATCH/PUT /employee_supervisors/1.json
  def update
    respond_to do |format|
      if @employee_supervisor.update(employee_supervisor_params)
        format.html { redirect_to @employee_supervisor, notice: 'Employee supervisor was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_supervisor }
      else
        format.html { render :edit }
        format.json { render json: @employee_supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_supervisors/1
  # DELETE /employee_supervisors/1.json
  def destroy
    @employee_supervisor.destroy
    respond_to do |format|
      format.html { redirect_to employee_supervisors_url, notice: 'Employee supervisor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_supervisor
      @employee_supervisor = EmployeeSupervisor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_supervisor_params
      params.require(:employee_supervisor).permit(:employee_id, :supervisor_id, :priority)
    end
end
