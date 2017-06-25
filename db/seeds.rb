# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Comentテーブルのレコードの初期化
Comment.delete_all

#Userテーブルのレコードの初期化
User.delete_all

#Blogテーブルのレコードの初期化
Topic.delete_all

name = "hoge"
auth_provider = "seed"

100.times do |m|
  email = Faker::Internet.email
  password = SecureRandom.hex(8)
  auth_uid = SecureRandom.hex(8)
  User.create!(id: m,
               provider: auth_provider,
               uid:      auth_uid,
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
  ActiveRecord::Base.connection.execute("SELECT setval('users_id_seq', coalesce((SELECT MAX(id)+1 FROM users), 1), false)")
  ActiveRecord::Base.connection.execute("SELECT setval('topics_id_seq', coalesce((SELECT MAX(id)+1 FROM users), 1), false)")
  ActiveRecord::Base.connection.execute("SELECT setval('comments_id_seq', coalesce((SELECT MAX(id)+1 FROM users), 1), false)")
end

@sequence =
