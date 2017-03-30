class CreateTruckEmployees < ActiveRecord::Migration
  def change
    create_table :truck_employees do |t|
      t.belongs_to :truck, index: true, foreign_key: true
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
