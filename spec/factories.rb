FactoryGirl.define do
  factory :reservation do
    id 1
    group 'Example group'
    username '田中 太郎'
    tel '090-1234-5678'
    email 'example@yoyaku-o.com'
    purpose 'For dance school'
    payment_method_id 1
    remarks 'This is a test'
    utilization_date '2016-08-01'
    utilization_time_id 1
  end
end

FactoryGirl.define do
  factory :equipment do
    id 1
    price 1500
    payment_type_id 1
    name 'ピアノ'
  end
end

FactoryGirl.define do
  factory :reservations_equipment do
    id 1
    reservation_id 1
    equipment_id 1
  end
end
