class AddLatAndLonToPlaydates < ActiveRecord::Migration[5.2]
  def change
    add_column :playdates, :latitude, :float
    add_column :playdates, :longitude, :float


  end
end
