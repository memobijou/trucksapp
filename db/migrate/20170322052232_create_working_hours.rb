class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.belongs_to :day, index: true, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
