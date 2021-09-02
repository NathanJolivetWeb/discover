# Cleaning all DB model
puts "Cleaning database..."
Friendship.destroy_all
User.destroy_all
Roadtrip.destroy_all
Partner.destroy_all
Itinerary.destroy_all
puts "=============================="

# Create users
puts "Creating some users..."

file = URI.open('https://avatars.githubusercontent.com/u/85315784?v=4')
nathan = User.new(email: "nathan@lewagon.fr", password: "password", first_name: "Nathan", last_name: "Jolivet", username: "[nathan]")
nathan.photo.attach(io: file, filename: 'avatar', content_type: 'image')
nathan.save

file = URI.open('https://avatars.githubusercontent.com/u/45171753?v=4')
luc = User.new(email: "luc@lewagon.fr", password: "password", first_name: "Luc", last_name: "Broion", username: "Le Pirate")
luc.photo.attach(io: file, filename: 'avatar', content_type: 'image')
luc.save

file = URI.open('https://avatars.githubusercontent.com/u/85166333?v=4')
christophe = User.new(email: "christophe@lewagon.fr", password: "password", first_name: "Christophe", last_name: "Becquey", username: "Loulou")
christophe.photo.attach(io: file, filename: 'avatar', content_type: 'image')
christophe.save

file = URI.open('https://avatars.githubusercontent.com/u/80858493?v=4')
dany = User.new(email: "dany@lewagon.fr", password: "password", first_name: "Dany", last_name: "Renard", username: "Heyeoka")
dany.photo.attach(io: file, filename: 'avatar', content_type: 'image')
dany.save

file = URI.open('https://avatars.githubusercontent.com/u/86717984?v=4')
estelle = User.new(email: "estelle@lewagon.fr", password: "password", first_name: "Estelle", last_name: "Dourthe", username: "Narco")
estelle.photo.attach(io: file, filename: 'avatar', content_type: 'image')
estelle.save

file = URI.open('https://avatars.githubusercontent.com/u/86261099?v=4')
violette = User.new(email: "violette@lewagon.fr", password: "password", first_name: "Violette", last_name: "Ruccio", username: "Maman")
violette.photo.attach(io: file, filename: 'avatar', content_type: 'image')
violette.save

file = URI.open('https://avatars.githubusercontent.com/u/86805683?v=4')
maxence = User.new(email: "maxence@lewagon.fr", password: "password", first_name: "Maxence", last_name: "Lerouge", username: "The King")
maxence.photo.attach(io: file, filename: 'avatar', content_type: 'image')
maxence.save

file = URI.open('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
sebastien = User.new(email: "sebastien@lewagon.fr", password: "password", first_name: "Sebastien", last_name: "Legris", username: "Eldirector")
sebastien.photo.attach(io: file, filename: 'avatar', content_type: 'image')
sebastien.save

file = URI.open('https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
elodie = User.new(email: "elodie@lewagon.fr", password: "password", first_name: "Elodie", last_name: "Lahaie", username: "Elo62")
elodie.photo.attach(io: file, filename: 'avatar', content_type: 'image')
elodie.save

file = URI.open('https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHVzZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
alexia = User.new(email: "alexia@lewagon.fr", password: "password", first_name: "Alexia", last_name: "Laverte", username: "Alexx")
alexia.photo.attach(io: file, filename: 'avatar', content_type: 'image')
alexia.save

file = URI.open('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80')
jean = User.new(email: "jean@lewagon.fr", password: "password", first_name: "Jean", last_name: "Lebleu", username: "Jeang")
jean.photo.attach(io: file, filename: 'avatar', content_type: 'image')
jean.save

puts "Congrats, #{User.count} users was created!"
puts "=============================="

# Create roadtrips
puts "Creating some roadtrips..."

file = URI.open('https://images.unsplash.com/photo-1534515888774-0cf3a63a14f7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
roadtrip1 = Roadtrip.new(title: "3 jours dans les Ardennes belges", status: "Terminé")
roadtrip1.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip1.save

file = URI.open('https://www.touraineloirevalley.com/wp-content/uploads/wpetourisme/--visuel-2021-MD-770x490.jpg')
roadtrip2 = Roadtrip.new(title: "Weekend en Touraine", status: "En cours")
roadtrip2.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip2.save

file = URI.open('https://images.unsplash.com/photo-1570651851409-93d5add773d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
roadtrip3 = Roadtrip.new(title: "2 jours au bord de la mer", status: "Terminé")
roadtrip3.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip3.save

file = URI.open('https://images.unsplash.com/photo-1503751192943-5537c30ba181?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
roadtrip4 = Roadtrip.new(title: "5 jours dans les Alpes", status: "En cours")
roadtrip4.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip4.save

file = URI.open('https://images.unsplash.com/photo-1507929632612-bff9cd17f808?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bW9udGFpbnMlMjByb2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
roadtrip5 = Roadtrip.new(title: "Escapade en montagne", status: "Terminé", owner: 3, start_date: "15-05-2020", end_date: "17-05-2020")
roadtrip5.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip5.save

file = URI.open('https://images.unsplash.com/photo-1629197428260-38bcac894354?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHJvYWQlMjB3aW5lfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
roadtrip6 = Roadtrip.new(title: "La route des vins", status: "Terminé", owner: 1, start_date: "23-10-2020" , end_date: "26-10-2020")
roadtrip6.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip6.save

file = URI.open('https://images.unsplash.com/photo-1558211515-c327762eb8bd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXJkZW5uZXMlMjByb2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
roadtrip7 = Roadtrip.new(title: "Week-end dans les ardennes", status: "Terminé", owner: 7, start_date: "17-04-2021", end_date: "18-04-2021")
roadtrip7.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip7.save

file = URI.open('https://images.unsplash.com/photo-1559131463-f9386f12e2db?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y290ZSUyMGQnb3BhbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
roadtrip8 = Roadtrip.new(title: "Balade sur la côte d'opale", status: "En cours", owner: 1, start_date: "24-09-2021", end_date: "26-09-2021")
roadtrip8.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip8.save

puts "Congrats, #{Roadtrip.count} roadtrips was created!"
puts "=============================="

# Create partners
puts "Creating some partners"

# Partners roadtrip 1
partner1 = Partner.new(user: maxence, roadtrip: roadtrip1)
partner1.save
partner2 = Partner.new(user: violette, roadtrip: roadtrip1)
partner2.save
partner3 = Partner.new(user: luc, roadtrip: roadtrip1)
partner3.save

# Partners roadtrip 2
partner1 = Partner.new(user: maxence, roadtrip: roadtrip2)
partner1.save
partner2 = Partner.new(user: violette, roadtrip: roadtrip2)
partner2.save
partner3 = Partner.new(user: luc, roadtrip: roadtrip2)
partner3.save
partner4 = Partner.new(user: dany, roadtrip: roadtrip2)
partner4.save
partner5 = Partner.new(user: christophe, roadtrip: roadtrip2)
partner5.save

# Partners roadtrip 3
partner1 = Partner.new(user: christophe, roadtrip: roadtrip3)
partner1.save
partner2 = Partner.new(user: violette, roadtrip: roadtrip3)
partner2.save
partner3 = Partner.new(user: luc, roadtrip: roadtrip3)
partner3.save
partner4 = Partner.new(user: dany, roadtrip: roadtrip3)
partner4.save
partner5 = Partner.new(user: maxence, roadtrip: roadtrip3)
partner5.save
partner7 = Partner.new(user: estelle, roadtrip: roadtrip3)
partner7.save

# Partners roadtrip 4
partner1 = Partner.new(user: maxence, roadtrip: roadtrip4)
partner1.save
partner2 = Partner.new(user: christophe, roadtrip: roadtrip4)
partner2.save
partner3 = Partner.new(user: luc, roadtrip: roadtrip4)
partner3.save
partner3 = Partner.new(user: dany, roadtrip: roadtrip4)
partner3.save

# Partners roadtrip 5
partner1 = Partner.new(user: christophe, roadtrip: roadtrip5)
partner1.save
partner2 = Partner.new(user: sebastien, roadtrip: roadtrip5)
partner2.save
partner3 = Partner.new(user: nathan, roadtrip: roadtrip5)
partner3.save

# Partners roadtrip 6
partner1 = Partner.new(user: christophe, roadtrip: roadtrip6)
partner1.save
partner2 = Partner.new(user: alexia, roadtrip: roadtrip6)
partner2.save
partner3 = Partner.new(user: nathan, roadtrip: roadtrip6)
partner3.save
partner4 = Partner.new(user: jean, roadtrip: roadtrip6)
partner4.save

# Partners roadtrip 7
partner1 = Partner.new(user: maxence, roadtrip: roadtrip7)
partner1.save
partner2 = Partner.new(user: estelle, roadtrip: roadtrip7)
partner2.save
partner3 = Partner.new(user: nathan, roadtrip: roadtrip7)
partner3.save
partner4 = Partner.new(user: violette, roadtrip: roadtrip7)
partner4.save

# Partners roadtrip 8
partner1 = Partner.new(user: nathan, roadtrip: roadtrip8)
partner1.save
partner2 = Partner.new(user: elodie, roadtrip: roadtrip8)
partner2.save
partner3 = Partner.new(user: christophe, roadtrip: roadtrip8)
partner3.save
partner4 = Partner.new(user: dany, roadtrip: roadtrip8)
partner4.save

puts "Congrats, #{Partner.count} partners was created!"
puts "=============================="

# Create messages
puts "Creating some messages"
# <Message:0x00007fe60eefece0 id: nil, content: nil, user_id: nil, roadtrip_id: nil, created_at: nil, updated_at: nil>
message1 = Message.new(content: "Très beau voyage, merci les copains.", user: maxence, roadtrip: roadtrip4)
message1.save


# Create some friendships
puts "Creating some friendships"
# <Friendship:0x00007fe4a43a0760 id: nil, requester_id: nil, addressed_id: nil, created_at: nil, updated_at: nil>
friendship1 = Friendship.new(requester: nathan, addressed: maxence)
friendship1.save
friendship2 = Friendship.new(requester: nathan, addressed: estelle)
friendship2.save
friendship3 = Friendship.new(requester: nathan, addressed: violette)
friendship3.save
friendship4 = Friendship.new(requester: nathan, addressed: luc)
friendship4.save
friendship5 = Friendship.new(requester: nathan, addressed: dany)
friendship5.save
friendship6 = Friendship.new(requester: nathan, addressed: christophe)
friendship6.save
friendship7 = Friendship.new(requester: maxence, addressed: dany)
friendship7.save
friendship8 = Friendship.new(requester: maxence, addressed: luc)
friendship8.save
friendship9 = Friendship.new(requester: maxence, addressed: estelle)
friendship9.save
friendship10 = Friendship.new(requester: maxence, addressed: violette)
friendship10.save
friendship11 = Friendship.new(requester: maxence, addressed: christophe)
friendship11.save
friendship12 = Friendship.new(requester: estelle, addressed: dany)
friendship12.save
friendship13 = Friendship.new(requester: estelle, addressed: luc)
friendship13.save
friendship14 = Friendship.new(requester: estelle, addressed: violette)
friendship14.save
friendship15 = Friendship.new(requester: estelle, addressed: christophe)
friendship15.save
friendship16 = Friendship.new(requester: dany, addressed: violette)
friendship16.save
friendship17 = Friendship.new(requester: dany, addressed: luc)
friendship17.save
friendship18 = Friendship.new(requester: dany, addressed: christophe)
friendship18.save
friendship19 = Friendship.new(requester: luc, addressed: christophe)
friendship19.save
friendship20 = Friendship.new(requester: luc, addressed: violette)
friendship20.save
friendship21 = Friendship.new(requester: christophe, addressed: violette)
friendship21.save
friendship22 = Friendship.new(requester: nathan, addressed: sebastien)
friendship22.save
friendship23 = Friendship.new(requester: nathan, addressed: jean)
friendship23.save
friendship24 = Friendship.new(requester: elodie, addressed: nathan)
friendship24.save
friendship25 = Friendship.new(requester: alexia, addressed: nathan)
friendship25.save

puts "Congrats, #{Friendship.count} friendships were created!"
puts "=============================="
