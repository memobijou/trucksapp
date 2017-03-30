class User < ActiveRecord::Base
    has_one :employee
    has_attached_file :image, styles: { medium: "300x300>", small: "200x200", thumb: "100x100>" }
    :storage => :s3,
                    :bucket => 'wawilkw',
                    :s3_credentials => "#{Rails.root}/config/aws.yml",
                    :path => "resources/:id/:style/:basename.:extension"
                    :url => ':s3_domain_url'

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
