class Supervisor < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :employee_supervisors
  accepts_nested_attributes_for :employee_supervisors, :allow_destroy => true, reject_if: proc { |attributes| attributes['priority'].blank? || attributes['employee_id'].blank?  }
end
