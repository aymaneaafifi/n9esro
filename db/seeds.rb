ayoube = User.create!(first_name: "ayoub", last_name:"idbaih", password: "ayoub1234", email: "ayoubahhf@gmqil.com", bio: "i am a good player")
oussama = User.create!(first_name: "oussama", last_name: "raji", password: "ayoub1234", email: "oussama@gmqil.com", bio: "i am a good player")
aymane = User.create!(first_name: "aymane", last_name: "allah", password: "aymane1234", email: "aymaneraji@gmqil.com", bio: "i am a good player")
fadllallah = User.create!(first_name: "fadlallah", last_name: "errami", password: "fadl1234", email: "fadlallah@gmqil.com", bio: "i am a good player")

terrain1 = Terrain.create!(name: "terrain1", address: "hay salam", price: 100)
terrain2 = Terrain.create!(name: "terrain2", address: "hay salam", price: 100)

match1 = Match.create!(title: "match1", description: "matchkkjkjkj1", date: "2021-10-10", terrain_id: terrain1.id, user_id: oussama.id)
match2 = Match.create!(title: "match2", description: "matchkjjjkjk2", date: "2021-10-10", terrain_id: terrain2.id, user_id: aymane.id)

# team1 = Team.create!(title: "team1", match_id: match1.id)
# team2 = Team.create!(title: "team2", match_id: match2.id)

# user_team1 = UserTeam.create!(user_id: 1, team_id: 1)
# user_team2 = UserTeam.create!g(user_id: 2, team_id: 2)
