class AddDefaultAdminToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :status, :boolean, :default => true
  end
end
