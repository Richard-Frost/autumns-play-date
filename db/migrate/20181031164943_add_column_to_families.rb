class AddColumnToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :email, :string
    add_column :families, :password_digest, :string
  end
end
