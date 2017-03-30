class EmployeeSupervisor < ActiveRecord::Base
  belongs_to :employee
  belongs_to :supervisor
  
  #validates_uniqueness_of :supervisor_id, scope: :employee_id
end
