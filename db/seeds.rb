# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all()
Coin.destroy_all()


require 'rest-client'

data = JSON.parse(RestClient.get('https://api.nomics.com/v1/currencies/ticker?key=049695e269b9c00adf1b33bf2e686359'))

    data.each do |c|
    Coin.create(
        name: c['name'],
        currency: c['currency'],
        symbol: c['symbol'],
        logo_url: c['logo_url'],
        price: c['price'],
        rank: c['rank'],
        price_date: c['price_date'],
        market_cap: c['market_cap'],
        circulating_supply: c['circulating_supply'],
        max_supply: c['max_supply'],
        high: c['high'],
        high_timestamp: c['high_timestamp']
    )
    end

50.times do
    User.create(
        name: Faker::Name.first_name,
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: '1234',
        img_url: Faker::Avatar.image,
        bg_url: Faker::LoremFlickr,
        coinbank: Faker::Number.between(from: 100, to: 1000),
        active: Faker::Boolean.boolean(true_ratio: 0.8)
    )
end



