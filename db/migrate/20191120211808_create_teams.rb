class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :roster
      t.integer :points, default: 0
      t.integer :rank
      t.integer :wins
      t.integer :loss
      t.integer :tie
      t.references :user
      t.references :league

      t.timestamps
    end
  end
end
