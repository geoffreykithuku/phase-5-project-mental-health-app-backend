class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.text :issue
      t.text :prescription
      t.boolean :status

      t.timestamps
    end
  end
end
