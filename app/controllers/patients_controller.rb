class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /patients
    
    def index
   patients = Patient.all
   render json: patients ,status: :ok
   end 

    #GET /patients/:id
   def show 
        patient = Patient.find_by(id: session[:user_id])
        if patient
         render json: patient
        else
         render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    #POST /patients
   def create 
    patient = Patient.create!(patient_params)
     session[:user_id] = patient.id
    render json: patient ,status: :created
   end

    #PATCH /patient/:id
    def update
    patient =find_patient
    patient.update!(patient_params)
    render json: patient,status: :accepted
    end 

   #DELETE patients/:id
   def destroy
    patient =find_patient
    doctor.destroy
    head :no_content
   end


   private

    def patient_params
       params.permit(:email,:name, :password, :password_confirmation)
    end 

   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end 

  def find_patient

  a_patient = Patient.find_by(id: params[:id])

  a_patient 
  end 


end
