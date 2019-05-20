class AddSelectToBuyInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_infos, :select, :integer
  end
end
