require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(name: 'Guy', photo: 'photo',
                     bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
       ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                     post_counter: 1)
    @user.save
    @post = Post.create(author_id: @user.id, title: 'Title 1',
                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
                         ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                        comments_counter: 1, likes_counter: 0)
    Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment 1')
  end

  it 'create comment should create a new comment' do
    @comment2 = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment 2')
    expect(@comment2.text).to eq('Comment 2')
  end

  it 'update_comments_counter method should update the comments counter of a post' do
    @post.comments.new(author_id: 3, post_id: 2, text: 'Comment 2').save
    expect(@post.comments_counter).to be(2)
  end
end
