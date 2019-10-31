require "faker"

puts "Destroy all old seeds"

User.destroy_all
Car.destroy_all

puts "Starting seeding process"

5.times do
  # TODO
  # Add full name
  user = User.create!(email: Faker::Internet.email, password: 123456)
  puts "Created #{user.email}"
  rand(3..10).times do
    category = Faker::Vehicle.car_type
    price = Faker::Commerce.price(range: 500..5000)
    brand = Faker::Vehicle.make
    location = Faker::Address.city
    model = Faker::Vehicle.model(make_of_model: brand)
    image = Unsplash::Photo.search("cars,#{brand},#{model}").first
    car = Car.new(brand: brand, category: category, price: price, model: model, year: Faker::Vehicle.year, location: Faker::Address.city, description: "#{image.description.nil? ? "" : image.description} The car license of is #{Faker::Vehicle.license_plate}. It is a #{Faker::Vehicle.fuel_type} car, with #{Faker::Vehicle.transmission} transmition. Its original color from factory is #{Faker::Vehicle.color} #{Faker::Lorem.paragraphs(number: 20)}.")
    car.owner = user
    car.remote_photo_url = image.urls["regular"]
    car.save!
  end
  puts "- Added #{user.cars.count} (#{user.cars.map { |car| car.brand }.join("-")}) to #{user.email}"
  puts ""
end



