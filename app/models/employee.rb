class Employee < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :employee_supervisors
  has_many :employee_workinghours
  has_many :truck_employees
  accepts_nested_attributes_for :employee_supervisors, :allow_destroy => true, reject_if: proc { |attributes| attributes['priority'].blank? || attributes['supervisor_id'].blank?  }
  accepts_nested_attributes_for :user, :allow_destroy => true, reject_if: proc { |attributes| attributes['vorname'].blank? || attributes['nachname'].blank? }
  accepts_nested_attributes_for :employee_workinghours, :allow_destroy => true, reject_if: proc {|attributes| attributes['working_hour_id'].blank?  }
end
