class CreateBuyInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_infos, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :payments
      t.string :addressee
      t.string :delivery_postcode
      t.text :delivery_address
      t.integer :buy_status

      t.timestamps
    end
  end
end
