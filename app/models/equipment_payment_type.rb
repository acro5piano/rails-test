class EquipmentPaymentType < ActiveHash::Base
  field :name
  create id: 1, name: 'コマ'
  create id: 2, name: '日'
end
