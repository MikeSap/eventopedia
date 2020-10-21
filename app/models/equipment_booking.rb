class EquipmentBooking < ApplicationRecord
    belongs_to :show
    belongs_to :equipment

    validates :equipment, :show, :quantity, presence: true
    validate :quantity_available

    def quantity_available
        errors.add(:quantity_available, "is lower than requested amount") unless 
        self.quantity <= self.show.vendor.equipment.find(self.equipment_id).quantity
    end

    def quantity_min?
        self.quantity <= 1
    end

    def quantity_max?
        self.quantity >= self.show.vendor.equipment.find(self.equipment_id).quantity
    end
end
