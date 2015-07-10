# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

user = User.new(
  name:     "User1",
  password: "helloworld",
  email:    "wolverine.ks+1@gmail.com"
  )

user.skip_confirmation!
user.save!

user = User.new(
  name:     "User2",
  password: "helloworld",
  email:    "wolverine.ks+2@gmail.com"
  )

user.skip_confirmation!
user.save!

user = User.new(
  name:     "User3",
  password: "helloworld",
  email:    "wolverine.ks+3@gmail.com"
  )

user.skip_confirmation!
user.save!

15.times do 
  app = Application.new(
    name: Faker::Company.name,
    url:  Faker::Internet.url,
    user: User.all.sample
    )
app.save!
end

1500.times do 
  event = Event.new(
    name:        Faker::Hacker.ingverb,
    application: Application.all.sample
    )
event.save!
end

puts "#{Application.all.count} applications created."
puts "#{Event.all.count} applications created."