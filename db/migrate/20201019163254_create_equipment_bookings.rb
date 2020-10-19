class CreateEquipmentBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment_bookings do |t|
      t.integer :equipment_id
      t.integer :show_id
      t.integer :quantity, default:1
      t.integer :quantity_checked_out, default:0
      t.integer :quantity_checked_in, default:0

      t.timestamps
    end
  end
end
