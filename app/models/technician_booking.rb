class TechnicianBooking < ApplicationRecord
    belongs_to :user
    belongs_to :show

    validates :user, :show, :call_time, :out_time, presence: true
    validate :tech_availability
    validate :out_after_call
    validate :booked_within

    def tech_availability
        byebug
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

    def booked_within
        booking = [self.call_time..self.out_time]
        show = [self.show.start..self.show.end]
        if !show.include?(booking)
        errors.add(:call_time, "must be within the show dates") 
        end
    end



end
