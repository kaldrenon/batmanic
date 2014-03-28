# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  post = Post.create(title: Faker::SwansonQuote.sentence, content: Faker::SwansonQuote.paragraphs( (rand * 3 + 1).to_i ).join("\n\n") )
  ((rand * 5).to_i).times { |j| post.comments.create( content: Faker::SwansonQuote.sentence ) }
end

