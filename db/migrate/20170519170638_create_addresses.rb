class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :film, index: true, foreign_key: true, null: false
      t.references :cinema, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
