class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :rubi_first_name
      t.string :rubi_last_name
      t.string :postcord
      t.text :address
      t.string :tel
      t.string :email
      t.string :password
      t.date :birthdate
      t.boolean :status
      t.boolean :admin

      t.timestamps
    end
  end
end
