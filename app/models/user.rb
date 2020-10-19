class User < ApplicationRecord
    belongs_to :vendor
    belongs_to :permisson_class
    has_many :technician_bookings
    has_many :shows, through: :technician_bookings
    
end
