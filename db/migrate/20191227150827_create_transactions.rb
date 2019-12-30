class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :coin

      t.timestamps
    end
  end
end
