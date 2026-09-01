class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :developer, null: false
      t.integer :release_year, null: false
      t.string :genre, null: false

      t.timestamps
    end
  end
end
