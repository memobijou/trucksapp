class AddIndexpriorityToEmployeeSupervisors < ActiveRecord::Migration
  def change
        add_index :employee_supervisors, [:priority, :employee_id], unique: true
  end
end
