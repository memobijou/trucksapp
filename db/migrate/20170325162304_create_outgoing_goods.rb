class CreateOutgoingGoods < ActiveRecord::Migration
  def change
    create_table :outgoing_goods do |t|
      t.belongs_to :truck, index: true, foreign_key: true
      t.string :request_number
      t.string :delivery_note_number

      t.timestamps null: false
    end
  end
end
