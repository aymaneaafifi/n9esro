
require "faker"

Terrain.destroy_all
Match.destroy_all

require "open-uri"

fadllah_image = URI.open("https://avatars.githubusercontent.com/u/94233481?v=4")
ayman_image = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1702541409/zcey3ssbq6oewbauwx0t.jpg")
ayoub_image = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1702540852/i9zuf4phlfeledeh4nvl.jpg")
oussama_image = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1702409240/bkvj6jcaiuvcbisuifx9.jpg")

ayoub = User.new(first_name: "ayoub", last_name: "idbaih", password: "ayoub1234", email: "ayoubahhf@gmqil.com", bio: "I am a good player")
oussama = User.new(first_name: "oussama", last_name: "essoufi", password: "ayoub1234", email: "oussama@gmqil.com", bio: "I am a good player")
aymane = User.new(first_name: "aymane", last_name: "afifi", password: "aymane1234", email: "aymaneraji@gmqil.com", bio: "I am a good player")
fadlallah = User.new(first_name: "fadlallah", last_name: "errami", password: "fadl1234", email: "fadlallah@gmqil.com", bio: "I am a good player")

ayoub.photo.attach(io: ayoub_image, filename: "ayoub.jpg", content_type: "image/jpg")
fadlallah.photo.attach(io: fadllah_image, filename: "fadllah.jpg", content_type: "image/jpeg")
aymane.photo.attach(io: ayman_image, filename: "ayman.jpg", content_type: "image/jpg")
oussama.photo.attach(io: oussama_image, filename: "oussama.jpg", content_type: "image/jpg")

ayoub.save!
oussama.save!
aymane.save!
fadlallah.save!

terrain1 = Terrain.create!(name: "terrain1", address: "hay salam", price: 100)
terrain2 = Terrain.create!(name: "terrain2", address: "hay salam", price: 100)

match1 = Match.create!(title: "match1", description: "matchkkjkjkj1", date: "2021-10-10", terrain: terrain1, user: oussama)


20.times do
  Terrain.create!(
    name: Faker::Name.unique.name,
    address: Faker::Address.full_address,
    desc: Faker::Quote.matz,
    price: rand(10..500)
  )
end


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
team2.user_teams << UserTeam.last
