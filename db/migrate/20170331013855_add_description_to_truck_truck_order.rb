class AddDescriptionToTruckTruckOrder < ActiveRecord::Migration
  def change
    add_column :truck_truck_orders, :notes, :string
  end
end
