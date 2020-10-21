class Equipment < ApplicationRecord
    belongs_to :vendor
    has_many :equipment_bookings
    has_many :shows, through: :equipment_bookings

    validates :name, :manufacturer, :quantity, :category, :sub_category, :vendor, presence: true

end
