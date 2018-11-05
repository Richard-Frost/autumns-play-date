class ChangeDefaultValueOfParentToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :parent, :boolean, :default => :false
  end
end
