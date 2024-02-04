ayoub = User.create!(first_name: "ayoub", last_name: "idbaih", password: "ayoub1234", email: "ayoubahhf@gmqil.com", bio: "I am a good player")
oussama = User.create!(first_name: "oussama", last_name: "raji", password: "ayoub1234", email: "oussama@gmqil.com", bio: "I am a good player")
aymane = User.create!(first_name: "aymane", last_name: "afifi", password: "aymane1234", email: "aymaneraji@gmqil.com", bio: "I am a good player")
fadlallah = User.create!(first_name: "fadlallah", last_name: "errami", password: "fadl1234", email: "fadlallah@gmqil.com", bio: "I am a good player")

terrain1 = Terrain.create!(name: "terrain1", address: "hay salam", price: 100)
terrain2 = Terrain.create!(name: "terrain2", address: "hay salam", price: 100)

match1 = Match.create!(title: "match1", description: "matchkkjkjkj1", date: "2021-10-10", terrain: terrain1, user: oussama)

team1 = Team.create!(title: "team1", match: match1)
team2 = Team.create!(title: "team2", match: match1)

# Define positions
positions = %w(GK DF1 DF2 MD ATK)

# Associate users with team1 and assign positions
users_with_positions = [ayoub, oussama, aymane].zip(positions)
users_with_positions.each do |user, position|
  user_team = UserTeam.create!(user: user, team: team1, position: position)
  team1.user_teams << user_team
end

# Associate user with team2
UserTeam.create!(user: fadlallah, team: team2, position: "GK") # Assign a default position, for example, "GK"
