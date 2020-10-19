class Show < ApplicationRecord
    belongs_to :vendor
    has_many :equipment_bookings
    has_many :equipments, through: :equipment_bookings
    has_many :technician_bookings
    has_many :users, through: :technician_bookings
    
end
