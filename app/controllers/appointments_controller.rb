class AppointmentsController < ApplicationController
   # before_action :set_current_user
     before_filter :authenticate_user!
   before_action :set_appointment, only: [:show, :edit, :update, :destroy]
   before_filter :ensure_admin, :only => [:edit, :destroy]

  #  def set_current_user
  #    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #  end
  
  # def current_user
  #   @current_user
  # end

  def ensure_admin
    unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorized
    end
  end

 #  def my_clients
 #    @appointments = Appointment.where('admin_id = ?', current_user.id).where('time >= ?', Time.now).order(time: :asc)  
 #  end
 
 # def my_appointments
 #   @appointments  = Appointment.where(user_id: current_user.id)
 # end

  # GET /appointments
  # GET /appointments.json
 
  def index
    @appointments = Appointment.where('time >= ?', Time.now).order(time: :asc)
    if @appointments.length == 0
    flash[:alert] = "You have no appointments. Create one now to get started."
   end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @appointments = Appointment.where('time > ?', Time.now).order(time: :asc)
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.save
  

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment.update(appointment_params)

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
   @appointment.destroy

    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:name, :email, :time, :user_id, :admin_id)
    end
end
