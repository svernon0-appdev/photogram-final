# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :posts, :class_name => "Photo", :foreign_key => "owner_id"
  has_many :comments
  has_many :requests_recieved, :class_name => "FollowRequest", :foreign_key => "recipient_id"
  has_many :requests_sent, :class_name => "FollowRequest", :foreign_key => "sender_id"
  has_many :likes

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates :username, :uniqueness => { :case_sensitive => false }
  validates :username, :presence => true
end
