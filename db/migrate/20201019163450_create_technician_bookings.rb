class CreateTechnicianBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :technician_bookings do |t|
      t.integer :user_id
      t.integer :show_id
      t.datetime :call_time
      t.datetime :out_time

      t.timestamps
    end
  end
end
