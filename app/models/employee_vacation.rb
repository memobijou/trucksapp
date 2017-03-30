class EmployeeVacation < ActiveRecord::Base
  belongs_to :employee_workinghour
end