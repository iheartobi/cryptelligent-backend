# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all()
Coin.destroy_all()
Transaction.destroy_all()


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
    people = ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXU45JLAGo2jBIkDW26Tgvf5DTIXje4gJgsGIbX9RySuhjHvHp", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXU6flEougRc8TzR1qKcrvrtiEDnoW2gn7kUuglZEkWjoZg1uJ", 
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSRtoxiBM6w_5IL-_L3VDiBBodjJlZ_8wQ9JKqqatnL7Y2DXaZX", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4Vg7PLOH4kxI4ha-W5V1izrwd4t8hfEi4dXfcE7ASIpbKmab0", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcShRaN8C_SiOcnFBY8kbdrEGqVlFgPXJ7F87tqSMPVBSl7VIE8-", 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-zGEmZH6_wQRSdINwWdQ389d84Hs-AjCiHkYswOSnchgkFiuG", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ9uvT4FYxnApuhsZeE2ytRU_mMsQKK9xyEchemLClufsk6-zac", 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-8js49as3rcRlFephdS7p11ZWxLPLRyQQx7wOlmc-1rXkqriz", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRyBJDKey754PcDaX4sdVplpeYw0G4W5tBXfDeAULionYCS9NF8", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStRJOvFgUAYOfrJeX48FSxSkjyjCxO2wnx8_kAtwO21APGoN4t", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQgQXYUYPYYuSBRC3YEkGDpfXNAaP5j4EWdSlXo9RAUAdWXArJz", 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-R0GEowevZbsMtnEvn-WauFXgHmiO48UE4813lXtfSsNvsWB1", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRtHaHA-JvoGleMKe9HXmJIyT0MLi0yKqIiuPST8g91FMnhCJ-r"]
    

    User.create(
        name: Faker::Name.first_name,
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: '1234',
        img_url: people.sample,
        bg_url: "https://rumplenewskins.com/image/322341-full_witter-coin-home.jpg",
        coinbank: Faker::Number.between(from: 100, to: 1000)
        
    )
end

30.times do 
    userId = User.all.sample
    coinId = Coin.all.sample
    Transaction.create(
        user_id: userId.id,
        coin_id: coinId.id
    )
end

5.times do
    Transaction.create(
        user_id: 1,
        coin_id: 1
    )
end



