class AskDoctorsController < ApplicationController
#   before_filter :authenticate_user!
#   before_action :set_ask_doctor, only: [:show, :edit, :update, :destroy]
#   before_filter :ensure_admin, :only => [:edit, :destroy]
  
# def ensure_admin
#   unless current_user && current_user.admin?
#     render :text => "Access Error Message", :status => :unauthorized
#   end
# end

  # GET /ask_doctors
  # GET /ask_doctors.json
  def index
    @ask_doctors = AskDoctor.all
  end
  def index
    @ask_doctors = AskDoctor.all
    if params[:search]
      @ask_doctors = AskDoctor.search(params[:search]).order("created_at DESC")
       else
      @ask_doctors= AskDoctor.all.order('created_at DESC')
    end
  end

  # GET /ask_doctors/1
  # GET /ask_doctors/1.json
  def show
  end

  # GET /ask_doctors/new
  def new
    @ask_doctor = AskDoctor.new
  end

  # GET /ask_doctors/1/edit
  def edit
  end

  # POST /ask_doctors
  # POST /ask_doctors.json
  def create
    @ask_doctor = AskDoctor.new(ask_doctor_params)

    respond_to do |format|
      if @ask_doctor.save
        format.html { redirect_to @ask_doctor, notice: 'Ask doctor was successfully created.' }
        format.json { render :show, status: :created, location: @ask_doctor }
      else
        format.html { render :new }
        format.json { render json: @ask_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ask_doctors/1
  # PATCH/PUT /ask_doctors/1.json
  def update
    respond_to do |format|
      if @ask_doctor.update(ask_doctor_params)
        format.html { redirect_to @ask_doctor, notice: 'Ask doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @ask_doctor }
      else
        format.html { render :edit }
        format.json { render json: @ask_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ask_doctors/1
  # DELETE /ask_doctors/1.json
  def destroy
    @ask_doctor.destroy
    respond_to do |format|
      format.html { redirect_to ask_doctors_url, notice: 'Ask doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask_doctor
      @ask_doctor = AskDoctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ask_doctor_params
      params.require(:ask_doctor).permit(:name, :title, :description)
    end
end
