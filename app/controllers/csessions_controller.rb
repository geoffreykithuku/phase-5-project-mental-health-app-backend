class CsessionsController < ApplicationController
     wrap_parameters format: []

     def create   
            doctor = Doctor.find_by(email: params[:email])

            if doctor && doctor.authenticate(params[:password])
                session[:user_id] = doctor.id
                render json: doctor, status: :created
            else
            doctor = Doctor.new
                doctor.validate
                render json: {errors: doctor.errors.full_messages}, status: :unauthorized
            end
      end 

        def destroy

            session.delete :user_id
        head :no_content
        end
end
