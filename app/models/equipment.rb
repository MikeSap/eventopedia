class Equipment < ApplicationRecord
    belongs_to :vendor
    has_many :equipment_bookings
    has_many :shows, through: :equipment_bookings
end
