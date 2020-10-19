class User < ApplicationRecord
    belongs_to :vendor
    belongs_to :permission_class
    has_many :technician_bookings
    has_many :shows, through: :technician_bookings

    has_secure_password
    
end
