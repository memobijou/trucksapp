class Truck < ActiveRecord::Base
    def completed?
      !completed_at.blank?
    end  
    has_one :incomming_good
    has_one :outgoing_good
    has_many :truck_employees
    has_many :truck_truck_orders
    has_attached_file :claim, styles: { medium: "300x300>", small: "200x200", thumb: "100x100>" }
  # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :claim, :content_type => /\Aimage\/.*\Z/
    #validates_inclusion_of :numberpallets, :in => 0..35, :message => "can't be greater than 35"
    accepts_nested_attributes_for :incomming_good, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :outgoing_good, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :truck_employees, :allow_destroy => true, :reject_if => :all_blank
end
