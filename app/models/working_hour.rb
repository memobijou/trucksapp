class WorkingHour < ActiveRecord::Base
  belongs_to :day
  accepts_nested_attributes_for :day, :allow_destroy => true, reject_if: proc { |attributes| attributes['day'].blank? }
  has_many :employee_workinghours
  accepts_nested_attributes_for :employee_workinghours, :allow_destroy => true, reject_if: proc { |attributes| attributes['employee_id'].blank?}
end
