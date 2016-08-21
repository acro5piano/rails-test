class Reservation < ActiveRecord::Base
  belongs_to_active_hash :payment_method
  belongs_to :utilization_time
  has_many :reservations_equipments, dependent: :destroy
  has_many :equipments, through: :reservations_equipments
  accepts_nested_attributes_for :reservations_equipments, allow_destroy: true

  def use?(equipment)
    equipments.include? equipment
  end

  def status
    if disabled?
      '削除済み'
    else
      '有効'
    end
  end

  def update_equipments
  end
end
