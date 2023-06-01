# seeds.rb
10.times do |i|
    User.create!(
      email: Faker::Internet.unique.email,
      password: 'securepassword123',
      name: Faker::Name.name,
      planet: ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'][i % 8],
      age: rand(100..500) # assuming these are alien ages
    )
  end
  
  categories = ["Engine", "Navigation System", "Life Support", "Propulsion", "Hull", "Weapon System", "Shield", "Communications"]
  
  10.times do |i|
    Part.create!(
      user_id: i + 1, # assuming users were created in order with ids 1-10
      category: categories[i % categories.length],
      origin: ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'][i % 8],
      years: rand(1..100),
      name: Faker::Space.unique.star,
      description: Faker::Lorem.sentence,
      price: rand(1000..5000)
    )
  end
  