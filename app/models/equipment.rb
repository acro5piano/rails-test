class Equipment < ActiveRecord::Base
  belongs_to_active_hash :payment_type, class_name: 'EquipmentPaymentType'
end
