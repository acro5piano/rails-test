class PaymentMethod < ActiveHash::Base
  field :name
  create id: 1, name: '現金'
  create id: 2, name: '銀行振込'
end
