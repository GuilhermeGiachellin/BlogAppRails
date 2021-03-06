require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(name: 'Guy', photo: 'photo',
                     bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
                    ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                     post_counter: 1)
    @user.save
    @post = Post.create(author_id: @user.id, title: 'Title 1',
                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
                         ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                        comments_counter: 1, likes_counter: 1)
    Like.create(author_id: @user.id, post_id: @post.id)
  end

  it 'update_likes_counter method' do
    @post.likes.new(author_id: @user.id, post_id: @post.id).save
    expect(@post.likes_counter).to be(2)
  end
end
