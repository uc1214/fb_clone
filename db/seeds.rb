# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Userテーブルのレコードの初期化
User.delete_all

#Blogテーブルのレコードの初期化
Topic.delete_all

#Comentテーブルのレコードの初期化
Comment.delete_all

100.times do |m|
  email = Faker::Internet.email
  name = "hoge"
  User.create!(id: m,
               email: email,
               name: name,
               password: password,
               password_confirmation: password,
               )
  Topic.create(
    id: m,
    title: "hoge",
    content: "hogehogefugafuga",
    user_id: m
  )
  Comment.create(
    topic_id: m,
    content: "fugahoge",
    user_id: m
  )
end
