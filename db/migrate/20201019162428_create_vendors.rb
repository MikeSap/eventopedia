class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :phone_number
      t.string :contact_email

      t.timestamps
    end
  end
end
