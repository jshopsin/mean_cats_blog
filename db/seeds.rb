Category.create(name: "Share the Love")
Category.create(name: "Sent by the Devil")
Category.create(name: "Nighttime Terrors")
Category.create(name: "Playful Kittens")
Category.create(name: "Cuddling")
Category.create(name: "Water Haters")
Category.create(name: "Random Stories")

categories = Category.all

20.times do
  username = Faker::Cat.name.downcase
  email = "#{username}@example.com"
  u = User.new(username: username, email: email, password: "password" )
  if u.save
    Article.create(title: Faker::RickAndMorty.quote, body: Faker::Hipster.paragraph, user_id: u.id, category_id: categories.sample.id)
  end
end