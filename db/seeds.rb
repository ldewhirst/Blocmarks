# include Faker

Bookmark.destroy_all
Topic.destroy_all

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
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
