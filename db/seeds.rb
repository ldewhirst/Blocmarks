# include Faker
#
# 5.times do
#   Topic.create!(
#   title: Faker::Lorem.word
#   )
# end
# topics = Topic.all
#
# 5.times do
#   Bookmark.create!(
#   topic: topics.sample
#   url: Faker::Internet.url
#   )
# end
# bookmarks = Bookmark.all
#
# puts "Seed finished"
# puts "#{Topic.count} topics created"
# puts "#{Bookmark.count} bookmarks created"
