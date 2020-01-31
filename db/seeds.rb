# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "rest-client"
require "json"

dummy_posts = JSON.parse(RestClient.get("https://jsonplaceholder.typicode.com/posts")).take(30)

dummy_images = JSON.parse(RestClient.get("https://picsum.photos/v2/list?page=2&limit=30"))

dummy_image_bucket = dummy_images.reduce([]) do |accumulator, image_hash|
    accumulator << image_hash["id"]
end

new_posts = dummy_posts.map.with_index do |post, index|
  Post.create(
    title: post["title"],
    content: post["body"],
    image: "https://picsum.photos/id/#{dummy_image_bucket[index]}/300"
  )
end
