class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :price
      t.integer :payment_type_id,  limit: 1

      t.timestamps null: false
    end
  end
end
