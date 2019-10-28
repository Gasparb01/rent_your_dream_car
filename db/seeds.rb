# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Car.destroy_all
gaston = User.create(email: "lala@gmail.com", password: "password", password_confirmation: "password")
# enzo_car = Car.create([{ model: 'GTR', brand: 'Nissan', year: '2018', category: 'Sport car' }])
auto_1 = gaston.cars.new( model: 'GTR', brand: 'Nissan', year: '2018', category: 'Sport car').save
auto_2 = gaston.cars.new( model: 'M2', brand: 'BMW', year: '2018', category: 'Sport car').save
auto_3 = gaston.cars.new( model: 'GT2RS', brand: 'Porsche', year: '2018', category: 'Sport car').save
auto_4 = gaston.cars.new( model: 'WRX', brand: 'SUBARU', year: '2018', category: 'Sport car').save
