# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.unique.last_name,
    email: "#{Faker::Name.first_name}@#{Faker::Name.unique.last_name}.org",
  # password: Faker::Lorem.characters(number: 10, min_alpha: 4),
    encrypted_password: "123456"
    )
end


10.times do
    Restaurant.create(
    name: Faker::JapaneseMedia::DragonBall.unique.character,
    address: ["Paris", "Lyon", "Nantes", "Lille", "Nice", "Rennes", "Strasbourg", "Nice", "Toulouse", "Bordeaux", "Biarritz", "Brest", "Pau"].sample,
    user_id: (1..10).to_a.sample
    )
end

10.times do
  Comment.create(
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
    user_id: (1..10).to_a.sample,
    restaurant_id: (1..10).to_a.sample
    )
  end
