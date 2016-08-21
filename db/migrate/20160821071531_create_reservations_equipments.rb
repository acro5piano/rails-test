class CreateReservationsEquipments < ActiveRecord::Migration
  def change
    create_table :reservations_equipments do |t|
      t.integer :reservation_id
      t.integer :equipment_id

      t.timestamps null: false
    end
  end
end
