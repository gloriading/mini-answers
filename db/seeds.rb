
20.times do
  Question.create(
    title: Faker::Cat.name,
    content: Faker::HitchhikersGuideToTheGalaxy.quote,
    view_count: rand(1..10)
  )
end

questions = Question.all
puts Cowsay.say("Create #{questions.count} questions", :ghostbusters)
