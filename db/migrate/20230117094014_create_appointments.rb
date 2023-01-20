class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.text :appointment_time
      t.text :appointment_date
      t.text :issue
      t.text :prescription
      t.string :status
      t.timestamps
    end
  end
end
