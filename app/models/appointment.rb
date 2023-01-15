class Appointment < ApplicationRecord
  belongs_to :doctor_id
  belongs_to :patient_id
end
