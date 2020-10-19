class PermissionClass < ApplicationRecord
    has_many :users
    belongs_to :vendor
end
