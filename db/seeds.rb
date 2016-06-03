# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  event = Event.new
  event.name = Faker::StarWars.planet
  event.description = Faker::StarWars.quote
  event.date = Time.now
  event.creator = User.find(1)
  event.save
end