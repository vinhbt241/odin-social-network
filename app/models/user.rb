class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "requester_id"
  has_many :addressees, through: :sent_friend_requests, source: :addressee

  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "addressee_id"
  has_many :requesters, through: :received_friend_requests, source: :requester

  has_many :user_friendships, class_name:"Friendship", foreign_key: "user_id"
  has_many :friends, through: :user_friendships, source: :friend

  has_many :in_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :users, through: :in_friendships, source: :user
end
