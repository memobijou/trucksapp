class CreateEmployeeSupervisors < ActiveRecord::Migration
  def change
    create_table :employee_supervisors do |t|
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :supervisor, index: true, foreign_key: true
      t.integer :priority

      t.timestamps null: false
    end
  end
end
