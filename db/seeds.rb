5.times do
  User.create!(
  email:     Faker::Internet.unique.safe_email,
  password:  Faker::Internet.password(10, 20)
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!([{
    user: users.all.sample,
    title: Faker::Seinfeld.character,
    body: Faker::Seinfeld.quote
  }])
end
wikis = Wiki.all

# Create an admin user
admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a standard user
standard = User.create!(
  email:    'standard@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
