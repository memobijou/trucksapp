class CreateIncommingGoods < ActiveRecord::Migration
  def change
    create_table :incomming_goods do |t|
      t.belongs_to :truck, index: true, foreign_key: true
      t.string :ordernumber

      t.timestamps null: false
    end
  end
end
