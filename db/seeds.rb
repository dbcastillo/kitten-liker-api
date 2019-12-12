# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "rest-client"
require "json"

dummy_posts = JSON.parse(RestClient.get("https://jsonplaceholder.typicode.com/posts"))

dummy_posts.each do |post|
  Post.create(
    title: post["title"],
    content: post["body"],
    image: "https://picsum.photos/300?random=#{rand}",
  )
end
