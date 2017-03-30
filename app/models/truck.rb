class Truck < ActiveRecord::Base
    has_one :incomming_good
    has_one :outgoing_good
    has_many :truck_employees
    has_many :truck_truck_orders
    accepts_nested_attributes_for :incomming_good, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :outgoing_good, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :truck_employees, :allow_destroy => true, :reject_if => :all_blank
end
