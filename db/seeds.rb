# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@admin', password: '123456', password_confirmation: '123456')
User.create(email: 'user@user', password: '123456', password_confirmation: '123456')

# criar 5 posts usando faker
5.times do
  Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: 1)
end

5.times do
  Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: 2)
end

# criar 5 comentários para cada post usando faker
Post.all.each do |post|
  5.times do
    Comment.create(content: Faker::Lorem.paragraph, user_id: 1, post_id: post.id)
  end
  5.times do
    Comment.create(content: Faker::Lorem.paragraph, user_id: 2, post_id: post.id)
  end
end
