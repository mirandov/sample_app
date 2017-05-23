class BarrelsController < ApplicationController
  before_action :set_barrel, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [ :search]
  before_action -> {check_role('admin', 'operator')}, except: [ :search]


  def search
    if params.has_key?('search')
      @barrels = Barrel.search(params['search'])
    else
      @barrels = []
    end
    params['search'] ||= {}

  end
  # GET /barrels
  # GET /barrels.json
  def index
    @barrels = Barrel.all
  end

  # GET /barrels/1
  # GET /barrels/1.json
  def show
  end

  # GET /barrels/new
  def new
    @barrel = Barrel.new
    # @barrel.build_wine_sort
    # @wine_sort = WineSort.all
  end


  # GET /barrels/1/edit
  def edit
    # @barrel.build_wine_sort
    # @wine_sort = WineSort.all

  end

  # POST /barrels
  # POST /barrels.json
  def create
    @barrel = Barrel.new(barrel_params)



    # @wine_sorts = []
    # (params[:barrel][:wine_sort]).each{|a| @wine_sorts << WineSort.find(a) if a.present?}
    respond_to do |format|
      if @barrel.save
        # @wine_sorts.each{|a| a.barrels << @barrel if !(@barrel.wine_sort.include?(@wine_sort))}
        format.html { redirect_to @barrel, notice: 'Barrel was successfully created.' }
        format.json { render :show, status: :created, location: @barrel }
      else
        format.html { render :new }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrels/1
  # PATCH/PUT /barrels/1.json
  def update
    respond_to do |format|
      if @barrel.update(barrel_params)
        format.html { redirect_to @barrel, notice: 'Barrel was successfully updated.' }
        format.json { render :show, status: :ok, location: @barrel }
      else
        format.html { render :edit }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrels/1
  # DELETE /barrels/1.json
  def destroy
    @barrel.destroy
    respond_to do |format|
      format.html { redirect_to barrels_url, notice: 'Barrel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrel
      @barrel = Barrel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barrel_params
      params.require(:barrel).permit(:location, :date_of_manufacture, :amount, :is_empty,
      :date_of_completion,:wine_sort_id, wine_sort_attributes:[:name,
      :type_of_wine, :color, :barrel_extract, :bottle_extract,:id, :_destroy])
    end
end
