class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.integer :price
      t.integer :stock
      t.integer :status
      t.integer :sales

      t.timestamps
    end
  end
end
