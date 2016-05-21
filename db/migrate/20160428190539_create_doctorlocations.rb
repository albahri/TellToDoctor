class CreateDoctorlocations < ActiveRecord::Migration
  def change
    create_table :doctorlocations do |t|
      t.string :doctorname
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
