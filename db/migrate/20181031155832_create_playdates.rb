class CreatePlaydates < ActiveRecord::Migration[5.2]
  def change
    create_table :playdates do |t|
      t.string :name
      t.datetime :datetime
      t.string :location
      t.string :description
      t.integer :originator

      t.timestamps
    end
  end
end
