class Vendor < ApplicationRecord
    has_many :shows
    has_many :users
    has_many :permission_classes
    has_many :equipment

    validates :name, :address, :url, :contact_email, :phone_number, presence: true


    after_create :create_owner_permission

    def create_owner_permission
        admin = PermissionClass.create(title: "admin", vendor: self, create_users: true, create_equipment:true, create_show:true, book_technician:true, book_equipment:true, bookable: false )
    end

end
