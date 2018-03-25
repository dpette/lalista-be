# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },{ name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'daniel.pettenon@uqido.com', nickname: 'dpette', name: 'Daniel Pettenon', password: "lalista-be")
User.create(email: 'enrico.pilotto@uqido.com', nickname: 'pioz', name: 'Enrico Pilotto', password: "piolottononpernotto")
User.create(
  email: 'cm@uqido.com',
  nickname: 'ciarlibraun',
  name: 'Carlo Martinucci',
  password: 'ciarlibraun'
)
