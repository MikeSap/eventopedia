class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :manufacturer
      t.integer :quantity
      t.string :category
      t.integer :vendor_id

      t.timestamps
    end
  end
end
