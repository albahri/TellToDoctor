class DoctorlocationsController < ApplicationController
  before_action :set_doctorlocation, only: [:show, :edit, :update, :destroy]
   before_filter :ensure_admin, :only => [:edit, :destroy]
    before_filter :authenticate_user!
 
  # GET /doctorlocations
  # GET /doctorlocations.json
  def index
   if params[:search].present?
    @doctorlocations = Doctorlocation.near(params[:search], 50)
  else
    @doctorlocations = Doctorlocation.all
  end
  end

  # GET /doctorlocations/1
  # GET /doctorlocations/1.json
  def show
  end

  # GET /doctorlocations/new
  def new
    @doctorlocation = Doctorlocation.new
  end

  # GET /doctorlocations/1/edit
  def edit
  end

  # POST /doctorlocations
  # POST /doctorlocations.json
  def create
    @doctorlocation = Doctorlocation.new(doctorlocation_params)

    respond_to do |format|
      if @doctorlocation.save
        format.html { redirect_to @doctorlocation, notice: 'Doctorlocation was successfully created.' }
        format.json { render :show, status: :created, location: @doctorlocation }
      else
        format.html { render :new }
        format.json { render json: @doctorlocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctorlocations/1
  # PATCH/PUT /doctorlocations/1.json
  def update
    respond_to do |format|
      if @doctorlocation.update(doctorlocation_params)
        format.html { redirect_to @doctorlocation, notice: 'Doctorlocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctorlocation }
      else
        format.html { render :edit }
        format.json { render json: @doctorlocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctorlocations/1
  # DELETE /doctorlocations/1.json
  def destroy
    @doctorlocation.destroy
    respond_to do |format|
      format.html { redirect_to doctorlocations_url, notice: 'Doctorlocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctorlocation
      @doctorlocation = Doctorlocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctorlocation_params
      params.require(:doctorlocation).permit(:doctorname, :address, :latitude, :longitude)
    end
    def ensure_admin
    unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorized
    end
   end
end
