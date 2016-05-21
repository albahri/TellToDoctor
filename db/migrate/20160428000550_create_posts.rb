class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_message
      t.references :ask_doctor, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :ask_doctors
  end
end
