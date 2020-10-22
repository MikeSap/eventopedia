class TechnicianBooking < ApplicationRecord
    belongs_to :user
    belongs_to :show

    validates :user, :show, :call_time, :out_time, presence: true
    validate :tech_availability, :call_within, :out_within, :out_after_call

    def tech_availability        
        bookings = self.user.technician_bookings.map {|booking| {call_time: booking.call_time, out_time: booking.out_time}}
        bool = bookings.all? do |schedule|
            ((schedule[:call_time].to_date..schedule[:out_time].to_date).to_a & (self.call_time.to_date..self.out_time.to_date).to_a).empty?
        end
        errors.add(:technician, "is unavailable at that time") unless bool
    end

    def out_after_call
        if self.out_time < self.call_time
          errors.add(:out_time, "must be after the call time") 
        end 
    end

    def call_within
        show = (self.show.start..self.show.end)
        if !show.include?(self.call_time)
        errors.add(:call_time, "must be within the show dates") 
        end
    end

    def out_within
        show = (self.show.start..self.show.end)
        if !show.include?(self.out_time)
        errors.add(:out_time, "must be within the show dates") 
        end
    end

    def call_time_display
        self.call_time.localtime.strftime("%b %-d %Y %l:%M %p")
    end

    def out_time_display
        self.out_time.localtime.strftime("%b %-d %Y %l:%M %p")
    end

end
