class CreatePermissionClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_classes do |t|
      t.boolean :create_users
      t.boolean :create_equipment
      t.boolean :create_show
      t.boolean :book_technician
      t.boolean :book_equipment
      t.integer :vendor_id

      t.timestamps
    end
  end
end
