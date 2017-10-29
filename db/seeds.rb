# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create({
                  name: 'Test 1',
                  surname: 'Test 1 surname',
                  is_active: true,
                  username: 'test1@bitcube.co.za',
                  password: 'P@ssw0rd'
              })

  User.create({
                  name: 'Test 2 ',
                  surname: 'Test 2 surname',
                  is_active: true,
                  username: 'test2@bitcube.co.za',
                  password: 'P@ssw0rd'
              })
  User.create({
                  name: 'Test 3',
                  surname: 'Test 3 surname',
                  is_active: true,
                  username: 'test3@bitcube.co.za',
                  password: 'P@ssw0rd'
              })

  User.create({
                  name: 'Test 4',
                  surname: 'Test 4 surname',
                  is_active: true,
                  username: 'test4@bitcube.co.za',
                  password: 'P@ssw0rd'
              })
end
if Post.count == 0
  Post.create({
                  title: 'Post 1',
                  message: 'Post 1 message',
                  is_active: true,
                  user_id: 1
              })
  Post.create({
                  title: 'Post 2',
                  message: 'Post 2 message',
                  is_active: true,
                  user_id: 2
              })
  Post.create({
                  title: 'Post 3',
                  message: 'Post 3 message',
                  is_active: true,
                  user_id: 1
              })
  Post.create({
                  title: 'Post 4',
                  message: 'Post 4 message',
                  is_active: true,
                  user_id: 2
              })
  Post.create({
                  title: 'Post 5',
                  message: 'Post 5 message',
                  is_active: true,
                  user_id: 3
              })
  Post.create({
                  title: 'Post 6',
                  message: 'Post 6 message',
                  is_active: true,
                  user_id: 4
              })
  Post.create({
                  title: 'Post 7',
                  message: 'Post 7 message',
                  is_active: true,
                  user_id: 3
              })
  Post.create({
                  title: 'Post 8',
                  message: 'Post 8 message',
                  is_active: true,
                  user_id: 4
              })
end
if UserFollower.count == 0
  UserFollower.create({
                          user_id: 1,
                          follower_id: 2
                      })
  UserFollower.create({
                          user_id: 2,
                          follower_id: 1
                      })
  UserFollower.create({
                          user_id: 1,
                          follower_id: 3
                      })
  UserFollower.create({
                          user_id: 3,
                          follower_id: 1
                      })
  UserFollower.create({
                          user_id: 1,
                          follower_id: 4
                      })
  # UserFollower.create({
  #                         user_id: 4,
  #                         follower_id: 1
  #                     })
end