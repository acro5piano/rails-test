class CreateUtilizationTimes < ActiveRecord::Migration
  def change
    create_table :utilization_times do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :holiday_price

      t.timestamps null: false
    end
  end
end
