class User < ApplicationRecord
    belongs_to :vendor
    belongs_to :permission_class
    has_many :technician_bookings
    has_many :shows, through: :technician_bookings

    validates :username, :first_name, :last_name, :password, :permission_class, :vendor_id, presence: true
    validates :username, uniqueness: {scope: :vendor_id, message: "is already in use by someone at your company"}
    
    
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

    def call_time_display
        self.call_time.localtime.strftime("%b %-d %Y %l:%M %p")
    end

    def out_time_display
        self.out_time.localtime.strftime("%b %-d %Y %l:%M %p")
    end
end
