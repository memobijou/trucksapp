class OutgoingGoodsController < ApplicationController
  before_action :set_outgoing_good, only: [:show, :edit, :update, :destroy]

  # GET /outgoing_goods
  # GET /outgoing_goods.json
  def index
    @outgoing_goods = OutgoingGood.all
  end

  # GET /outgoing_goods/1
  # GET /outgoing_goods/1.json
  def show
  end

  # GET /outgoing_goods/new
  def new
    @outgoing_good = OutgoingGood.new
  end

  # GET /outgoing_goods/1/edit
  def edit
  end

  # POST /outgoing_goods
  # POST /outgoing_goods.json
  def create
    @outgoing_good = OutgoingGood.new(outgoing_good_params)

    respond_to do |format|
      if @outgoing_good.save
        format.html { redirect_to @outgoing_good, notice: 'Outgoing good was successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_good }
      else
        format.html { render :new }
        format.json { render json: @outgoing_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outgoing_goods/1
  # PATCH/PUT /outgoing_goods/1.json
  def update
    respond_to do |format|
      if @outgoing_good.update(outgoing_good_params)
        format.html { redirect_to @outgoing_good, notice: 'Outgoing good was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_good }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_goods/1
  # DELETE /outgoing_goods/1.json
  def destroy
    @outgoing_good.destroy
    respond_to do |format|
      format.html { redirect_to outgoing_goods_url, notice: 'Outgoing good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing_good
      @outgoing_good = OutgoingGood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_good_params
      params.require(:outgoing_good).permit(:truck_id, :request_number, :delivery_note_number)
    end
end
