Message.connection.execute("TRUNCATE TABLE messages;")

5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  [5, 6, 7, 8].sample.times do
    Message.create(
      title: Faker::Lorem.word,
      content: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false),
      image: Faker::LoremFlickr.image(size: "200x200"),
      user: user
    )
  end

  puts "Created User name: #{user.name}"
  puts "Created #{user.messages.count} messages"
  puts "==============================="
end
