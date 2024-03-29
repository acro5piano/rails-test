class Reservation < ActiveRecord::Base
  has_many :reservations_equipments, dependent: :destroy
  has_many :equipments, through: :reservations_equipments
  belongs_to_active_hash :payment_method
  belongs_to :utilization_time
  accepts_nested_attributes_for :equipments

  validates :username, presence: true
  validates :tel, presence: true, length: { maximum: 20 }
  validates :email, presence: true, email: true
  validates :purpose, presence: true
  validates :payment_method_id, presence: true, length: { maximum: 1 }
  validates :utilization_date, presence: true
  validates :utilization_time_id, presence: true, length: { maximum: 1 }

  def use?(equipment)
    equipments.include?(equipment)
  end

  def status
    if disabled?
      '削除済み'
    else
      '有効'
    end
  end

  def self.monthly_schedule(year, month)
    schedule = {}
    1.upto(31) do |day|
      schedule[day] = {
        1 => 0,
        2 => 1
      }
    end
    schedule
  end
end
