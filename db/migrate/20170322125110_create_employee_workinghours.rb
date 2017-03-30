class CreateEmployeeWorkinghours < ActiveRecord::Migration
  def change
    create_table :employee_workinghours do |t|
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :working_hour, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
