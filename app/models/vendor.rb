class Vendor < ApplicationRecord
    has_many :shows
    has_many :users
    has_many :permission_classes
    has_many :equipment
end
