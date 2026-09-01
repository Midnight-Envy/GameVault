class CreateGameEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :game_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :status, null: false
      t.integer :rating
      t.integer :hours_played
      t.text :notes

      t.timestamps
    end
  end
end
