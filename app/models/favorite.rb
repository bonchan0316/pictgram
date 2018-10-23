class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'
end
