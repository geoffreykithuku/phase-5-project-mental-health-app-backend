class SessionController < ApplicationController
    skip_before_action :authorized_account, only: [:login]
class SessionsController < ApplicationController 
 wrap_parameters format: []

     def create   
            patient = Patient.find_by(email: params[:email])

            if patient && patient.authenticate(params[:password])
                session[:user_id] = patient.id
                render json: patient, status: :created
            else
            patient = Patient.new
                patient.validate
                render json: {errors: patient.errors.full_messages}, status: :unauthorized
            end
      end 

        def destroy

            patient = Patient.find_by(id: session[:user_id])

            if patient
                session.delete :user_id
                head :no_content
            else
                patient = Patient.new 
                patient.validate
                render json: {errors: patient.errors.full_messages}, status: :unauthorized
            end
        end
  
end
end
