# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Clear existing directors
Director.destroy_all

# Generate 10 fake directors
10.times do
  Director.create!(
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraph,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 90)
  )
end
