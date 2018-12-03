class AddZipcodeColumnToPlaydate < ActiveRecord::Migration[5.2]
  def change
    add_column :playdates, :zipcode, :string
  end
end
