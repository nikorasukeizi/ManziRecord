class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :disc_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
