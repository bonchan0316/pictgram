class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic, counter_cache: :favorites_count

  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'
end
