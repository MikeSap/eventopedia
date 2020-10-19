class Vendor < ApplicationRecord
    has_many :shows
    has_many :users
    has_many :permissions_classes
    has_many :technician_bookings
    has_many :equipment_bookings
    has_many :equipments
end
