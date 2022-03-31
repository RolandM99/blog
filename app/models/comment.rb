class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
