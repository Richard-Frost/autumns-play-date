class AddColumnToParents < ActiveRecord::Migration[5.2]
  def change
    add_column :parents, :title, :string
    add_column :parents, :parent, :boolean, default: :false
  end
end
