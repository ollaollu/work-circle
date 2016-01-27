class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :sport
      t.string :country
      t.text :league
      t.text :teams
      t.text :bet
      t.float :odds
      t.string :status
      t.datetime :game_time
      t.datetime :tip_date

      t.timestamps null: false
    end
    add_index :tips, :tip_date
  end
end
