class AddSpecialtyToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :specialty, :string
  end
end
