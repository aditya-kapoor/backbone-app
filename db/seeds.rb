5.times do 
  Post.create({
    title: Faker::Lorem.sentences(3),
    body: Faker::Lorem.paragraph(3)
  })
end