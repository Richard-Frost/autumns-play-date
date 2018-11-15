class ChangeColumnNameInRequests < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :user_id, :family_id
  end
end
