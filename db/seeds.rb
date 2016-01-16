# include Faker

Bookmark.destroy_all
Topic.destroy_all
User.destroy_all

5.times do
  User.create!(
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password(8)
  )
end

5.times do
  Topic.create!(
  title: Faker::Lorem.word
  )
end
topics = Topic.all

topics.each do |topic|
  5.times do
    Bookmark.create!(
    topic: topic,
    url: Faker::Internet.url
    )
  end
end

u = User.new(email: "test@blocmarks.com", password: 'password')
u.skip_confirmation!
u.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
