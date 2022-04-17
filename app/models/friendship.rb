class Friendship < ApplicationRecord
  belongs_to :friend_left, class_name: "User"
  belongs_to :friend_right, class_name: "User"
end
