class IncommingGoodsController < ApplicationController
  before_action :set_incomming_good, only: [:show, :edit, :update, :destroy]

  # GET /incomming_goods
  # GET /incomming_goods.json
  def index
    @incomming_goods = IncommingGood.all
  end

  # GET /incomming_goods/1
  # GET /incomming_goods/1.json
  def show
  end

  # GET /incomming_goods/new
  def new
    @incomming_good = IncommingGood.new
  end

  # GET /incomming_goods/1/edit
  def edit
  end

  # POST /incomming_goods
  # POST /incomming_goods.json
  def create
    @incomming_good = IncommingGood.new(incomming_good_params)

    respond_to do |format|
      if @incomming_good.save
        format.html { redirect_to @incomming_good, notice: 'Incomming good was successfully created.' }
        format.json { render :show, status: :created, location: @incomming_good }
      else
        format.html { render :new }
        format.json { render json: @incomming_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomming_goods/1
  # PATCH/PUT /incomming_goods/1.json
  def update
    respond_to do |format|
      if @incomming_good.update(incomming_good_params)
        format.html { redirect_to @incomming_good, notice: 'Incomming good was successfully updated.' }
        format.json { render :show, status: :ok, location: @incomming_good }
      else
        format.html { render :edit }
        format.json { render json: @incomming_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomming_goods/1
  # DELETE /incomming_goods/1.json
  def destroy
    @incomming_good.destroy
    respond_to do |format|
      format.html { redirect_to incomming_goods_url, notice: 'Incomming good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incomming_good
      @incomming_good = IncommingGood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incomming_good_params
      params.require(:incomming_good).permit(:truck_id, :ordernumber)
    end
end
