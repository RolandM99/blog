class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_counter_of_likes
    post.increment!(:likes_counter)
  end
end
