class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.string :rubi_name

      t.timestamps
    end
  end
end
