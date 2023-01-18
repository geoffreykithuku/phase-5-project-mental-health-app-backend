class AppointmentsController < ApplicationController
    def index 
        @appointments = Appointment.all 
        render json: @appointments 
    end 

    def show 
        @appointment = Appointment.find_by_id(params[:id]) 
        render json: @appointment 
    end 

    def create 
        appointment = Appointment.create!(appointment_params)
        render json: appointment, status: :created
    end 

    def update
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(appointment_time: params["appointment_time"], issue: params["issue"], prescription: params["prescription"], status: params["status"]  , doctor_id: params["doctor_id"], patient_id: params["patient_id"])
        render json: appointment 
    end

def approve 
    ap = Appointment.find_by(id: params[:id])
    ap.update!(status: "Approved")
    render json: ap, status: :accepted
end

    def destroy
        appointment = Appointment.find_by(id: params[:id])
        appointment.destroy
        head :no_content
    end 


    private 
    def appointment_params 
        params.permit(:appointment_date, :appointment_time, :issue, :status, :prescription, :doctor_id, :patient_id)
    end
end
