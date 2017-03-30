class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :unitload
      t.integer :numberpallets
      t.string :supplier
      t.string :licenseplate
      t.string :shippingagency
      t.boolean :occupied
      t.boolean :incoming
      t.boolean :outgoing
      t.string :ordernumber
      t.string :request_number
      t.string :delivery_note_number

      t.timestamps null: false
    end
  end
end
