class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :family_id

      t.timestamps
    end
  end
end
