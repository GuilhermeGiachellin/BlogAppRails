class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_count
    user.increment!(:posts_counter)
  end

  def returns_five_most_recent_comments
    comments.order(created_at: :DESC).limit(5)
  end
end
