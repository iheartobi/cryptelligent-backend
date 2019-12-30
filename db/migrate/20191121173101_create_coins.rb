class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :currency
      t.string :symbol
      t.string :logo_url
      t.bigint :price
      t.integer :rank
      t.datetime :price_date
      t.bigint :market_cap
      t.bigint :circulating_supply
      t.bigint :max_supply
      t.bigint :high
      t.bigint :high_timestamp
      t.integer :max_sold, default: 0
      


      t.timestamps
    end
  end
end
