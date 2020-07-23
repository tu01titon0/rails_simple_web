Message.connection.execute("TRUNCATE TABLE messages;")

15.times do
  message = Message.create(
    title: Faker::Lorem.word,
    content: Faker::Address.full_address,
    image: Faker::LoremFlickr.image(size: "100x100"),
    athor: Faker::Name.name
  )

  puts "Added #{message.title}"
end
