# Cleaning all DB model
puts "Cleaning database..."
User.destroy_all
Roadtrip.destroy_all
Partner.destroy_all
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

puts "Congrats, #{User.count} users was created!"
puts "=============================="

# Create roadtrips
puts "Creating some roadtrips..."

file = URI.open('https://images.unsplash.com/photo-1534515888774-0cf3a63a14f7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
roadtrip1 = Roadtrip.new(title: "3 jours dans les Ardennes belges", status: "Terminé")
roadtrip1.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip1.save

file = URI.open('https://www.touraineloirevalley.com/wp-content/uploads/wpetourisme/--visuel-2021-MD-770x490.jpg')
roadtrip2 = Roadtrip.new(title: "Weekend en Touraine", status: "Terminé")
roadtrip2.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip2.save

file = URI.open('https://images.unsplash.com/photo-1570651851409-93d5add773d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
roadtrip3 = Roadtrip.new(title: "2 jours au bord de la mer", status: "Terminé")
roadtrip3.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip3.save

file = URI.open('https://images.unsplash.com/photo-1503751192943-5537c30ba181?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
roadtrip4 = Roadtrip.new(title: "5 jours dans les Alpes", status: "Terminé")
roadtrip4.photo.attach(io: file, filename: 'avatar', content_type: 'image')
roadtrip4.save

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
partner5 = Partner.new(user: nathan, roadtrip: roadtrip2)
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
partner6 = Partner.new(user: nathan, roadtrip: roadtrip3)
partner6.save
partner7 = Partner.new(user: estelle, roadtrip: roadtrip3)
partner7.save

# Partners roadtrip 4
partner1 = Partner.new(user: nathan, roadtrip: roadtrip4)
partner1.save
partner2 = Partner.new(user: christophe, roadtrip: roadtrip4)
partner2.save
partner3 = Partner.new(user: luc, roadtrip: roadtrip4)
partner3.save
partner3 = Partner.new(user: dany, roadtrip: roadtrip4)
partner3.save

puts "Congrats, #{Partner.count} partners was created!"
puts "=============================="

# #Create messages
# puts "Creating some messages"
# #<Message:0x00007fe60eefece0 id: nil, content: nil, user_id: nil, roadtrip_id: nil, created_at: nil, updated_at: nil>
# message1 = Message.new(content:"", user:, roadtrip_id:)
