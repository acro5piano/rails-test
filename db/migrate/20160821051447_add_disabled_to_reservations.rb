class AddDisabledToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :disabled, :boolean, default: false
  end
end
