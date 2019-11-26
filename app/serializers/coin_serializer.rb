class CoinSerializer < ActiveModel::Serializer
  attributes :id, :name, :currency, :symbol, :logo_url, :price, :rank, :price_date, :market_cap, :circulating_supply, :max_supply, :high, :high_timestamp, :max_sold
end
