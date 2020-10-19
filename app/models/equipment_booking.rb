class EquipmentBooking < ApplicationRecord
    belongs_to :show
    belongs_to :equipment
    belongs_to :vendor
end
