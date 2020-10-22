class User < ApplicationRecord
    belongs_to :vendor
    belongs_to :permission_class
    has_many :technician_bookings
    has_many :shows, through: :technician_bookings

    validates :username, :first_name, :last_name, :password, :permission_class, :vendor_id, presence: true
    validates :username, uniqueness: {scope: :vendor_id, message: "has been taken by one of your coworkers already!"}

    
    has_secure_password
    
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def full_name_and_title
        "#{self.permission_class.title} - #{self.full_name}"
    end

    def bookable?
        self.permission_class.bookable
    end
end
