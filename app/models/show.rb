class Show < ApplicationRecord
    belongs_to :vendor
    has_many :equipment_bookings
    has_many :equipment, through: :equipment_bookings
    has_many :technician_bookings
    has_many :users, through: :technician_bookings

    validates :name, :venue, :client, :start, :end, presence: true

    def start_display
        self.start.localtime.strftime("%b %-d %Y %l:%M %p")
    end

    def end_display
        self.end.localtime.strftime("%b %-d %Y %l:%M %p")
    end
end
