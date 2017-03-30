class EmployeeWorkinghoursController < ApplicationController
  before_action :set_employee_workinghour, only: [:show, :edit, :update, :destroy]

  # GET /employee_workinghours
  # GET /employee_workinghours.json
  def index
    @employee_workinghours = EmployeeWorkinghour.all
  end

  # GET /employee_workinghours/1
  # GET /employee_workinghours/1.json
  def show
  end

  # GET /employee_workinghours/new
  def new
    @employee_workinghour = EmployeeWorkinghour.new
    @employee_workinghour.build_working_hour

  end

  # GET /employee_workinghours/1/edit
  def edit
    @employee_workinghour.build_working_hour
  end

  # POST /employee_workinghours
  # POST /employee_workinghours.json
  def create
    @employee_workinghour = EmployeeWorkinghour.new(employee_workinghour_params)

    respond_to do |format|
      if @employee_workinghour.save
        format.html { redirect_to @employee_workinghour, notice: 'Employee workinghour was successfully created.' }
        format.json { render :show, status: :created, location: @employee_workinghour }
      else
        format.html { render :new }
        format.json { render json: @employee_workinghour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_workinghours/1
  # PATCH/PUT /employee_workinghours/1.json
  def update
    respond_to do |format|
      if @employee_workinghour.update(employee_workinghour_params)
        format.html { redirect_to @employee_workinghour, notice: 'Employee workinghour was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_workinghour }
      else
        format.html { render :edit }
        format.json { render json: @employee_workinghour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_workinghours/1
  # DELETE /employee_workinghours/1.json
  def destroy
    @employee_workinghour.destroy
    respond_to do |format|
      format.html { redirect_to employee_workinghours_url, notice: 'Employee workinghour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_workinghour
      @employee_workinghour = EmployeeWorkinghour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_workinghour_params
      params.require(:employee_workinghour).permit(:employee_id, :working_hour_id)
    end
end
