class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.integer :buy_info_id
      t.integer :item_id
      t.integer :buy_count
      t.integer :price

      t.timestamps
    end
  end
end
