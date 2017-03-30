class EmployeeWorkinghour < ActiveRecord::Base
  belongs_to :employee
  belongs_to :working_hour
  has_many :employee_vacations
end
