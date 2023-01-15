class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.text :issue
      t.datetime :appointment_time
      t.references :doctor_id, null: false, foreign_key: true
      t.references :patient_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
