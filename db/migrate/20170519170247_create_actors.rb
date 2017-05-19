class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.text :ln, null: false
      t.text :fn, null: false
      t.text :sn
      t.date :birthday, null: false

      t.timestamps null: false
    end
  end
end
