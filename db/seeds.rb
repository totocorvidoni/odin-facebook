User.create!(name: 'pupe', email: 'pupe@mail.com')
User.create!(name: 'toto', email: 'toto@mail.com')

1.upto(2) do |user|
  10.times do
    User.find(user).posts.create!(title: Faker::Lorem.sentence,
                                  content: Faker::Lorem.paragraph)
  end
end

10.times do |n|
  User.find(2).comments.create!(post_id: n + 1,
                                content: Faker::Lorem.paragraph)
end

50.times do
  User.create!(name: Faker::Name.new, email: Faker::Internet.free_email)
end
