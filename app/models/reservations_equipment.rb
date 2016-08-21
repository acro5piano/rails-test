class ReservationsEquipment < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :equipment
end
