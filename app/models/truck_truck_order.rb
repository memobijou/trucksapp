class TruckTruckOrder < ActiveRecord::Base
    belongs_to :truck
    belongs_to :truck_order
    accepts_nested_attributes_for :truck, :allow_destroy => true, reject_if: proc { |attributes| attributes['unitload'].blank? }
end
