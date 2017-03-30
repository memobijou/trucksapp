class CreateTruckOrders < ActiveRecord::Migration
  def change
    create_table :truck_orders do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
