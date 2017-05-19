class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.text :name, null: false
      t.text :genre, null: false
      t.text :lasting, null: false
      t.text :country, null: false
      t.text :companies, null: false
      t.integer :min_age, null: false

      t.timestamps null: false
    end
  end
end
