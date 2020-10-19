class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :user_class_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
