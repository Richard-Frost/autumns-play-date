class ChangeParentsTableToUser < ActiveRecord::Migration[5.2]
  def change
    rename_table :parents, :users
  end
end
