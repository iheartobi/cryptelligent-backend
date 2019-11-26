class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :tier
      t.integer :win_amount

      t.timestamps
    end
  end
end
