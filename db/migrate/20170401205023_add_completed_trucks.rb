class AddCompletedTrucks < ActiveRecord::Migration
  def change
      add_column :trucks, :completed, :boolean
  end
end
