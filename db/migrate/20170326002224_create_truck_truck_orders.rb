class CreateTruckTruckOrders < ActiveRecord::Migration
  def change
    create_table :truck_truck_orders do |t|
      t.belongs_to :truck, index: true, foreign_key: true
      t.belongs_to :truck_order, index: true, foreign_key: true
      t.time :time

      t.timestamps null: false
    end
  end
end
