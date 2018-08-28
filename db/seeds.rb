# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#----------------------------------------------------------
 # require 'random_data'

# Create Wikis
# 1.times do
#
#    Wiki.create!(
#      title:  RandomData.random_word,
#      body:   RandomData.random_paragraph
#    )
#  end
#  wikis = Wiki.all
#
# puts "#{Wiki.count} wikis created"
#----------------------------------------------------------


# Create User
5.times do
  User.create([{
    name: Faker::Name.name,
  }])
end

# Create Wikis
50.times do
  Wiki.create([{
    title: Faker::Seinfeld.character,
    body: Faker::Seinfeld.quote
  }])
end

puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
