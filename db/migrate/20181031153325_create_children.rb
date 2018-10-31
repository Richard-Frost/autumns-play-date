class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :family_id
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
