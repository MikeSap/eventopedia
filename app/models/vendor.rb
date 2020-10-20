class Vendor < ApplicationRecord
    has_many :shows
    has_many :users
    has_many :permission_classes
    has_many :equipment

    after_save :create_owner_permission

    def create_owner_permission
        owner = PermissionClass.create(title: "admin", vendor: self, create_users: true, create_equipment:true, create_show:true, book_technician:true, book_equipment:true )
    end

end
