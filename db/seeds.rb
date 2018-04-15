PASSWORD = '123456'

Answer.destroy_all
Question.destroy_all
User.destroy_all

super_user = User.create(
  name: 'Jane',
  email: 'jane@gmail.com',
  password: PASSWORD
)

10.times.each do
  name = Faker::Pokemon.name

  User.create(
    name: name,
    email: "#{name.downcase}@glorious.com",
    password: PASSWORD
  )
end

users = User.all
puts Cowsay.say("Create #{users.count} users", :tux)

# ------------------------------------------------------------------------
20.times do
  Question.create(
    title: Faker::Book.title,
    content: Faker::HitchhikersGuideToTheGalaxy.quote,
    view_count: rand(1..10),
    user: users.sample
  )
end

questions = Question.all
puts Cowsay.say("Create #{questions.count} questions", :ghostbusters)

# ------------------------------------------------------------------------
questions.each do |question|
  rand(0..5).times.each do
    Answer.create(
      body: Faker::Lorem.paragraph,
      question: question,
      user: users.sample
    )
  end
end

answers = Answer.all

puts Cowsay.say("Create #{answers.count} answers", :moose)
