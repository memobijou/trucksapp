class CreateEmployeeVacations < ActiveRecord::Migration
  def change
    create_table :employee_vacations do |t|
      t.belongs_to :employee_workinghour, index: true, foreign_key: true
      t.date :datum
      t.boolean :urlaub
      t.timestamps null: false
    end
  end
end
