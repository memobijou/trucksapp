class TruckOrder < ActiveRecord::Base
    has_many :truck_truck_orders
    accepts_nested_attributes_for :truck_truck_orders, :allow_destroy => true, :reject_if => :all_blank 
end