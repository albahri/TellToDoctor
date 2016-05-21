class CreateAskDoctors < ActiveRecord::Migration
  def change
    create_table :ask_doctors do |t|
      t.string :name
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
