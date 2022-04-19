class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "requester_id"
  has_many :addressees, through: :sent_friend_requests, source: :addressee

  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "addressee_id"
  has_many :requesters, through: :received_friend_requests, source: :requester

  has_many :friendship_lefts, class_name: "Friendship", foreign_key: "friend_left_id"
  has_many :friend_rights, through: :friendship_lefts, source: :friend_right

  has_many :friendship_rights, class_name: "Friendship", foreign_key: "friend_right_id"
  has_many :friend_lefts, through: :friendship_rights, source: :friend_left

  has_many :posts, foreign_key: "author_id"
  has_many :comments, through: :posts

  def friends 
    friend_lefts + friend_rights
  end
end
