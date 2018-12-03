class AddLocationRelatedColumnsToFamily < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :latitude, :float
    add_column :families, :longitude, :float
    add_column :families, :zipcode, :string
  end
end
