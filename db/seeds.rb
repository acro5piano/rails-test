# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reservation.create!(group: 'Example group',
                    username: '田中 太郎',
                    tel: '090-1234-5678',
                    email: 'example@yoyaku-o.com',
                    purpose: 'For dance school',
                    payment_method_id: 1,
                    remarks: 'This is a test',
                    utilization_date: '2016-08-01',
                    utilization_time_id: 1)

ReservationsEquipment.create!(reservation_id: 1,
                              equipment_id: 1)

Equipment.create!(price: 1500,
                  payment_type_id: 1,
                  name: 'ピアノ')
Equipment.create!(price: 500,
                  payment_type_id: 2,
                  name: '音響')
Equipment.create!(price: 300,
                  payment_type_id: 2,
                  name: 'プロジェクター')

UtilizationTime.create!(name: '午前',
                        price: 2160,
                        holiday_price: 2880)
UtilizationTime.create!(name: '午後',
                        price: 2360,
                        holiday_price: 3080)
UtilizationTime.create!(name: '夕方',
                        price: 2670,
                        holiday_price: 3390)
UtilizationTime.create!(name: '夜間',
                        price: 3600,
                        holiday_price: 4320)

