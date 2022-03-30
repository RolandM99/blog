class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def update_posts_counter
    author.increment!(:post_counter)
  end
end
