class AddIndexToEmployeeSupervisors < ActiveRecord::Migration
  def change
    add_index :employee_supervisors, [:supervisor_id, :employee_id], unique: true
  end
end
