class AddPrescriptionToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :prescription, :text
  end
end
