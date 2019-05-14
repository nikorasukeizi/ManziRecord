class RenameBarthdateColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :barthdate, :birthdate
  end
end
