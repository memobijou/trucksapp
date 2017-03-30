class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_employee_user, only: [:edit, :new]
  before_action :set_employee_supervisor, only: [:edit, :new]
  before_action :set_employee_workinghour, only: [:edit, :new]

  

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
   @employee_supervisors = @employee.employee_supervisors.all
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_user
    @employee.employee_supervisors.build
    @employee.employee_workinghours.build

  end

  # GET /employees/1/edit
  def edit
      @employee.build_user
      @employee.employee_supervisors.build
      @employee.employee_workinghours.build

  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    begin
    respond_to do |format|
      if @employee.update(employee_params)
    
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotUnique
      redirect_to :back , notice: 'Entry already exists'
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:user_id, employee_supervisors_attributes: [:id, :supervisor_id, :priority, :_destroy], user_attributes: [:id ,:vorname, :nachname, :email, :image, :_destroy], employee_workinghours_attributes: [:id, :working_hour_id, :_destroy])
    end
    
    def set_employee_user
      @employee_user = User.where('id NOT IN (?)',Employee.select("user_id"))
    end
  
    def set_employee_supervisor
      @employee_supervisor = Supervisor.where('id NOT IN (?)',EmployeeSupervisor.select("supervisor_id"))
    end
    
    def set_employee_workinghour
      @employee_workinghour = WorkingHour.where('id NOT IN (?)',EmployeeWorkinghour.select("working_hour_id"))
    end
    
end
