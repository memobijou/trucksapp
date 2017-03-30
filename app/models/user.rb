class User < ActiveRecord::Base
    has_one :employee
    has_attached_file :image, styles: { medium: "300x300>", small: "200x200", thumb: "100x100>" }
end
