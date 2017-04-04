class AddClaimToTrucks < ActiveRecord::Migration
 def self.up
    change_table :trucks do |t|
      t.attachment :claim
    end
  end

  def self.down
    remove_attachment :trucks, :claim
  end
end
