class CreateEquipmentBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment_bookings do |t|
      t.integer :equipment_id
      t.integer :show_id
      t.integer :quantity
      t.integer :quantity_checked_out
      t.integer :quantity_checked_in

      t.timestamps
    end
  end
end
