class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_count

  def returns_five_most_recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  private

  def update_post_count
    author.update(post_counter: author.posts.count)
  end
end
