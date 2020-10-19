class TechnicianBooking < ApplicationRecord
    belongs_to :user
    belongs_to :show
    belongs_to :vendor
end
