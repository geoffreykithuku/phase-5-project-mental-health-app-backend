class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /patients
    def index
   patients = Patient.all
   render json: patients ,status: :ok
   end 

    #GET /patients/:id
    def show

    patient = find_patient
    render json: patient,status: :found
    end

    #POST /patients
   def create 
    patient = Patient.create!(patient_params)
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
       params.permit(:email,:name)
    end 

   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end 

  def find_patient

  a_patient = Patient.find_by(id: params[:id])

  a_patient 
  end 

def record_not_found_method
    render json: {error: "Patient not found"}, status: :not_found
end

end
