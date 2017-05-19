class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.text :name, null: false
      t.text :address, null: false
      
      t.index :address, unique: true

      t.timestamps null: false
    end
  end
end
