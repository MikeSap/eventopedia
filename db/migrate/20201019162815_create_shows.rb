class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :venue
      t.string :client
      t.datetime :start
      t.datetime :end
      t.integer :vendor_id
      t.timestamps
    end
  end
end
