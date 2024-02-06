
require "faker"

Terrain.destroy_all
Match.destroy_all

ayoube = User.create!(first_name: "ayoub", last_name:"idbaih", password: "ayoub1234", email: "ayoubahhf@gmqil.com", bio: "i am a good player")
oussama = User.create!(first_name: "oussama", last_name: "raji", password: "ayoub1234", email: "oussama@gmqil.com", bio: "i am a good player")
aymane = User.create!(first_name: "aymane", last_name: "allah", password: "aymane1234", email: "aymaneraji@gmqil.com", bio: "i am a good player")
fadllallah = User.create!(first_name: "fadlallah", last_name: "errami", password: "fadl1234", email: "fadlallah@gmqil.com", bio: "i am a good player")

terrain1 = Terrain.create!(name: "terrain1", address: "hay salam", price: 100)
terrain2 = Terrain.create!(name: "terrain2", address: "hay salam", price: 100)

match1 = Match.create!(title: "match1", description: "matchkkjkjkj1", date: "2021-10-10", terrain: terrain1, user: oussama)
match2 = Match.create!(title: "match2", description: "matchkjjjkjk2", date: "2021-10-10", terrain: terrain2, user: aymane)

team1 = Team.create!(title: "team1", match: match1)
team2 = Team.create!(title: "team2", match: match2)

UserTeam.create!(user: ayoube, team: team1)
UserTeam.create!(user: oussama, team: team2)

20.times do
  Terrain.create!(
    name: Faker::Name.unique.name,
    address: Faker::Address.full_address,
    desc: Faker::Quote.matz,
    price: rand(10..500)
  )
end
