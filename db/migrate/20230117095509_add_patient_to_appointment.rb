class AddPatientToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :patients, null: false, foreign_key: true
  end
end
