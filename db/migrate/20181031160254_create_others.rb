class CreateOthers < ActiveRecord::Migration[5.2]
  def change
    create_table :others do |t|
      t.string :title
      t.integer :family_id

      t.timestamps
    end
  end
end
