class TechnicianBooking < ApplicationRecord
    belongs_to :user
    belongs_to :show

    validates :user, :show, :call_time, :out_time, presence: true
    validate :out_after_call
    validate :booked_within

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
