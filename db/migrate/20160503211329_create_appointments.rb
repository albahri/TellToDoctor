class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :email
      t.datetime :time
      t.integer :user_id
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
