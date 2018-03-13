
20.times do
  Question.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    view_count: rand(1..10)
  )
end

questions = Question.all
puts Cowsay.say("Create #{questions.count} questions", :ghostbusters)
