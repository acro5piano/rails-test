class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :group
      t.string :username, null: false
      t.string :tel, limit: 20
      t.string :email, null: false
      t.text :purpose, null: false
      t.integer :payment_method, null: false
      t.text :remarks, null: false
      t.datetime :use_date, null: false
      t.integer :use_time, limit: 1, null: false

      t.timestamps null: false
    end
    add_index :reservations, :use_date
    add_index :reservations, :use_time
  end
end
