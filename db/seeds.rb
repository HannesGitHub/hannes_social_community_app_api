# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create({
                  name: 'Hannes',
                  surname: 'van Tonder',
                  is_active: true,
                  username: 'hannes@bitcube.co.za',
                  password: 'P@ssw0rd'
              })

  User.create({
                  name: 'Jimmy ',
                  surname: 'van Kimmel',
                  is_active: true,
                  username: 'jimmy@bitcube.co.za',
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
end