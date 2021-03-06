# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Flat.destroy_all

users = []
5.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: Faker::Blockchain::Ethereum.address,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

25.times do
  Flat.create!(
    title: Faker::Book.title,
    address: Faker::Movies::Hobbit.location,
    price: Faker::Number.within(range: 100..3000),
    description: Faker::Quote.famous_last_words,
    user: users.sample
  )
end
