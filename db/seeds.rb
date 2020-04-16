# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

justin = User.create(name: 'Justin', username: 'JP', instrument: "guitar", location: "Oakland", password: "asdf", commitment: 2, email: "justinphil02@yahoo.com")
jakethedog = User.create(name: 'Jake the Dog', username: 'Jake', instrument: "drums", location: "Adventure Kingdom", password: "asdf", commitment: 2, email: "jake@statefarm.com")


new_buddas = Band.create(name: "new buddas", bio: "seattle lo fi chill crew", location: "Seattle")
corn = Band.create(name: "corn", bio: "simple midwest friends loving life", location: "Farm, Ohio")

greg = new_buddas.users.create(name: "Greg", bio: "check out my soundcloud", username: "gdawg", instrument: "vocals", password: "asdf", email: "greg@hotmail.com", commitment: 3, location: "seattle")

loren = corn.users.create(name: 'Loren', username: 'lobeats', instrument: 'bass', password: 'asdf', bio: 'rock and roll man')

eurosomething = Band.create(name: 'eurosomething', bio: 'solo project by loren', location: 'LA')
eurosomething.users << loren 


eurosomething.tags.create(name: "singer-songwriter")

post = corn.posts.create(title: "Need more Cowbell", content: "Need someone to bring something visionary to the sesh")


