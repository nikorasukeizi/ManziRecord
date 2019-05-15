class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :rubi_first_name, :string
    add_column :users, :rubi_last_name, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :text
    add_column :users, :tel, :string
    add_column :users, :barthdate, :date
    add_column :users, :status, :boolean, default: true
    add_column :users, :admin, :boolean, default: false
  end
end
