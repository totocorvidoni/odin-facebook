User.create!(name: 'pupe', email: 'pupe@mail.com', password: 'password')
User.create!(name: 'toto', email: 'toto@mail.com', password: 'password')

50.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.free_email,
               password: 'password')
end

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

10.times do |n|
  User.find(1).initiated_friendships.create!(friend_id: n + 2)
end

User.find(2).requests_sent.create!(to_id: 3)
