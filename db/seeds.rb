# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Chip.destroy_all
Game.destroy_all 

x1 = User.create(name: "Brandon", password:"hi")
x2 = User.create(name: "Grace", password: "ffef")

c1 = Chip.create(user:x1, amount:450)