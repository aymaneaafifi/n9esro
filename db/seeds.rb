
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

terrain1 = Terrain.create!(name: 'terrain1', address: 'hay salam', price: 100)
terrain2 = Terrain.create!(name: 'terrain2', address: 'hay salam', price: 100)
terrain3 = Terrain.create!(name: 'City foot Oasis', address: 'Oasis', price: 500)
URI.open ('https://oasissportscity.ma/wp-content/uploads/2019/04/100.jpg')
terrain4 = Terrain.create!(name: 'Atlantic FC', address: 'El Hank', price: 450-750)
URI.open ('https://www.sportomaroc.ma/images/uploads/clubs/medium/club-football-casablanca-foot-terrains.png')
terrain5 = Terrain.create!(name: 'Decathlon Ain Sebaa', address: 'Ain Sebaa', price: 450)
URI.open ('https://www.sport-nature.com/wp-content/uploads/2016/06/photos-iphone-26-AOUT-2016-064.jpg')
terrain6 = Terrain.create!(name: 'Ginga Foot', address: 'Maarif', price: 450)
URI.open ('https://www.marocannonces.com/user_images/392/1202767.jpg')
terrain7 = Terrain.create!(name: "L'etoile", address: 'Oasis', price: 500)
URI.open ('https://static.yabiladi.com/files/articles/138599_95b6493e9b0932beb6afb2295322923820230407183313_thumb_565.jpg')
terrain8 = Terrain.create!(name: 'Sidi Maarouf Foot', address: 'Sidi Maarouf', price: 150)
URI.open ('https://rue20.com/wp-content/uploads/2022/01/casa.jpeg')
terrain9 = Terrain.create!(name: 'Terrain Sidi Othmane', address: 'Sidi Othmane', price: 200)
URI.open ('https://ar.hibapress.com/wp-content/uploads/2021/12/4iejR3pufBnTZlKf0ldGPAb4wS3HZDPOyaA0WhSh.jpeg?mrf-size=m')
terrain10 = Terrain.create!(name: 'DMC foot', address: 'Derb Moulay chrif', price: 120)
URI.open ('https://www.pjd.ma/static/uploads/2022/05/mlb_lqrb_bld_lbyd.jpg')
terrain11 = Terrain.create!(name: 'Belvedere stadium', address: 'Belvedere', price: 300)
URI.open ('https://i1.hespress.com/wp-content/uploads/2019/08/terrain_de_proche_924386125.jpg')
terrain12 = Terrain.create!(name: 'Roches Noires mini-foot', address: 'Roches Noires', price: 300)
URI.open ('https://al3omk.com/wp-content/uploads/2023/03/6427522e95fad.jpg')
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
team2.user_teams << UserTeam.last
