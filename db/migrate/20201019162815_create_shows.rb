class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :venue
      t.datetime :start
      t.datetime :end
      t.integer :vendor_id

      t.timestamps
    end
  end
end
