user1 = User.new
user1.name = "Vinh"
user1.email = 'vinh@gmail.com'
user1.password = "Vinh241"
user1.password_confirmation = "Vinh241"
user1.save!

user2 = User.new
user2.name = "Viktor"
user2.email = 'viktor@gmail.com'
user2.password = "Viktor241"
user2.password_confirmation = "Viktor241"
user2.save!

user3 = User.new
user3.name = "Viola"
user3.email = "viola@gmail.com"
user3.password = "Viola241"
user3.password_confirmation = "Viola241"
user3.save!

Post.create(topic: "Post of Vinh", content: "This is a test post to see if it's working properly", author_id: 1)
Post.create(topic: "Post of Viktor", content: "This is second test post, gonna check if comments working properly", author_id: 2)

Comment.create(user_id: 1, post_id: 2, content: "This is Vinh's comment")
