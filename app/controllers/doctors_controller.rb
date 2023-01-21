class DoctorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /doctor
    def index
   doctors = Doctor.all
   render json: doctors ,status: :ok
   end 

    #GET /doctors/:id
     def show 
        doctor = Doctor.find_by(id: session[:user_id])
        if doctor
         render json: doctor
        else
         render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    #POST /doctors
   def create 
    doctor = Doctor.create!(doctor_params)
    session[:user_id] = doctor.id
    render json: doctor ,status: :created
   end

    #PATCH /doctor/:id
    def update
    doctor =find_doctor
    doctor.update!(doctor_params)
    render json: doctor,status: :accepted
    end 

   #DELETE doctors/:id
   def destroy
    doctor =find_doctor
    doctor.destroy
    head :no_content
   end


   private

    def doctor_params
       params.permit(:email,:name, :specialty, :password, :password_confirmation)
    end 

   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end 

  def find_doctor

  a_doctor = Doctor.find_by(id: params[:id])

  a_doctor 
  end 

def record_not_found_method
    render json: {error: "Doctor not found"}, status: :not_found
end

end
