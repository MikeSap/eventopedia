class Equipment < ApplicationRecord
    belongs_to :vendor
    has_many :equipment_bookings
    has_many :shows, through: :equipment_bookings

    validates :name, :quantity, :category, :sub_category, :vendor, presence: true
    validates_uniqueness_of :name, scope: :manufacturer 

    def created_at_display
        self.created_at.localtime.strftime("%b %-d %Y %l:%M %p")
    end
end
