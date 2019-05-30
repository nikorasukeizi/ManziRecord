class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :buy_count

      t.timestamps
    end
  end
end
