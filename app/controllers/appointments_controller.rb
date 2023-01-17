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
        appointment = Appointment.new(appointment_time: params["appointment_time"], issue: params["issue"], prescription: params["prescription"], status: params["status"]  , doctor_id: params["doctor_id"], patient_id: params["patient_id"])
        appointment.save 
        render json: appointment 
    end 

    def update
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(appointment_time: params["appointment_time"], issue: params["issue"], prescription: params["prescription"], status: params["status"]  , doctor_id: params["doctor_id"], patient_id: params["patient_id"])
        render json: appointment 
    end

    def destroy
        appointment = Appointment.find_by(id: params[:id])
        appointment.delete
        render json: appointment 
    end 

end
