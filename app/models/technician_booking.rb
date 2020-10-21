class TechnicianBooking < ApplicationRecord
    belongs_to :user
    belongs_to :show

    validates :user, :show, :call_time, :out_time, presence: true
    validate :tech_availability
    #Need to figure out how to pass arguments into this custom validation
    # validate :tech_availability, :call_time, :out_time

    # def tech_availability(call_time, out_time)
    # errors.add(:tech_avail, "is unavailable") unless 
    # shows = self.user.shows
    # available = true
    # shows.each do |show| 
    #     byebug
    #         if out_time >= show.start &&  call_time <= show.end
    #         available =  false
    #         elsif call_time > show.start && call_time < show.end
    #         available =  false
    #         elsif out_time > show.start && out_time < show.end
    #         available = false               
    #         end        
    #     end
    #     available         
    # end

    def tech_availability
        byebug
        bookings = self.user.technician_bookings.map {|booking| {call_time: booking.call_time, out_time: booking.out_time}}
        bool = bookings.all? do |schedule|
            ((schedule[:call_time].to_date..schedule[:out_time].to_date).to_a & (self.call_time.to_date..self.out_time.to_date).to_a).empty?
        end
        errors.add(:technician, "is unavailable at that time") unless bool
    end
end
