class ChangeStatusInAppointments < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :status, :string 
  end
end
