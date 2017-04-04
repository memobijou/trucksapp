class AddCompletedAtToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :completed_at, :datetime
  end
end
