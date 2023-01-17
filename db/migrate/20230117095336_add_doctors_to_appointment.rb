class AddDoctorsToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :doctors, null: false, foreign_key: true
  end
end
