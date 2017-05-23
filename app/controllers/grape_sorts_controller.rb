class GrapeSortsController < ApplicationController
  before_action :set_grape_sort, only: [:show, :edit, :update, :destroy]

  # GET /grape_sorts
  # GET /grape_sorts.json
  def index
    @grape_sorts = GrapeSort.all
  end

  # GET /grape_sorts/1
  # GET /grape_sorts/1.json
  def show
  end

  # GET /grape_sorts/new
  def new
    @grape_sort = GrapeSort.new
  end

  # GET /grape_sorts/1/edit
  def edit
  end

  # POST /grape_sorts
  # POST /grape_sorts.json
  def create
    @grape_sort = GrapeSort.new(grape_sort_params)

    respond_to do |format|
      if @grape_sort.save
        format.html { redirect_to @grape_sort, notice: 'Grape sort was successfully created.' }
        format.json { render :show, status: :created, location: @grape_sort }
      else
        format.html { render :new }
        format.json { render json: @grape_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grape_sorts/1
  # PATCH/PUT /grape_sorts/1.json
  def update
    respond_to do |format|
      if @grape_sort.update(grape_sort_params)
        format.html { redirect_to @grape_sort, notice: 'Grape sort was successfully updated.' }
        format.json { render :show, status: :ok, location: @grape_sort }
      else
        format.html { render :edit }
        format.json { render json: @grape_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grape_sorts/1
  # DELETE /grape_sorts/1.json
  def destroy
    @grape_sort.destroy
    respond_to do |format|
      format.html { redirect_to grape_sorts_url, notice: 'Grape sort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grape_sort
      @grape_sort = GrapeSort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grape_sort_params
      params.require(:grape_sort).permit(:name, :place_of_growth, :date_of_collection)
    end
end
