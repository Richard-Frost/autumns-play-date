class AddColumnToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :message, :string
  end
end
