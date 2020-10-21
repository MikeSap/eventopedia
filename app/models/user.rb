class User < ApplicationRecord
    belongs_to :vendor
    belongs_to :permission_class
    has_many :technician_bookings
    has_many :shows, through: :technician_bookings

    validates :username, :password, :permission_class, :vendor_id, presence: true
    validates :username, uniqueness: {scope: :vendor_id, message: "has been taken by one of your coworkers already!"}

    
    has_secure_password
    
end
