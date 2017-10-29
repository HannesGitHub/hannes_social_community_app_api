# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create({
                  name: 'John',
                  surname: 'Doe',
                  is_active: true,
                  username: 'john@bitcube.co.za',
                  password: 'P@ssw0rd'
              })

  User.create({
                  name: 'Sarah',
                  surname: 'Doe',
                  is_active: true,
                  username: 'sarah@bitcube.co.za',
                  password: 'P@ssw0rd'
              })
  User.create({
                  name: 'Andrew',
                  surname: 'Doe',
                  is_active: true,
                  username: 'andres@bitcube.co.za',
                  password: 'P@ssw0rd'
              })

  User.create({
                  name: 'Anton',
                  surname: 'Doe',
                  is_active: true,
                  username: 'anton@bitcube.co.za',
                  password: 'P@ssw0rd'
              })
end
if Post.count == 0
  Post.create({
                  title: 'Post 1',
                  message: 'This is the first post',
                  is_active: true,
                  user_id: 1
              })
  Post.create({
                  title: 'Post 2',
                  message: 'This is the second post',
                  is_active: true,
                  user_id: 2
              })
  Post.create({
                  title: 'Post 3',
                  message: 'Post three',
                  is_active: true,
                  user_id: 1
              })
  Post.create({
                  title: 'Post 4',
                  message: 'Post four',
                  is_active: true,
                  user_id: 2
              })
  Post.create({
                  title: 'Post 5',
                  message: 'Post five',
                  is_active: true,
                  user_id: 3
              })
  Post.create({
                  title: 'Post 6',
                  message: 'Post six',
                  is_active: true,
                  user_id: 4
              })
  Post.create({
                  title: 'Post 7',
                  message: 'Post seven',
                  is_active: true,
                  user_id: 3
              })
  Post.create({
                  title: 'Post 8',
                  message: 'Post eight',
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
end