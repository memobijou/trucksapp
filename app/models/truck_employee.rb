class TruckEmployee < ActiveRecord::Base
  belongs_to :truck
  belongs_to :employee
  accepts_nested_attributes_for :employee, :allow_destroy => true, :reject_if => :all_blank
end