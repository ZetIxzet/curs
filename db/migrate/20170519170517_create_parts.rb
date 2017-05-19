class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.text :role, null: false
      t.references :film, index: true, foreign_key: true, null: false
      t.references :actor, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
