require 'rails_helper'
RSpec.describe 'Post Show page', type: :feature do
  describe 'shows users' do
    before(:each) do
      first = User.create(name: 'Aku', photo: 'https://url/image', bio: 'Software Engineer', email: 'aku@example.com',
                          password: '123456', post_counter: 1, confirmed_at: Time.now)
      @sec = User.create(name: 'Zac', photo: 'https://url/image', bio: 'Software engineer', email: 'test1@example.com',
                         password: '123456', post_counter: 2, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @first_post = Post.create(title: 'Sky is the limit', text: 'sky is the limit...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @second_post = Post.create(title: 'On my way', text: 'to the moon...', comment_counter: 0, likes_counter: 0,
                                 author: first)
      @third_post = Post.create(title: 'California love', text: 'Tupac Shakur on the flow...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @first_comment = Comment.create(text: 'Put God First', author: User.first, post: Post.first)

      visit user_post_path(first, @first_post)
    end

    it 'We can see the author of Post' do
      expect(page).to have_content('Aku')
    end

    it 'We can see how many comments a post has' do
      post_commented = Post.first
      expect(page).to have_content(post_commented.comment_counter)
    end

    it 'We can see the title' do
      expect(page).to have_content('Sky is the limit')
    end

    it 'We can see the comments of each commentor.' do
      expect(page).to have_content 'Put God First'
    end

    it 'We can see how many likes a post has' do
      post_liked = Post.first
      expect(page).to have_content(post_liked.likes_counter)
    end

    it 'We can see the body of the post' do
      expect(page).to have_content('sky is the limit...')
    end

    it 'We can see the name of the commentator' do
      post = Post.first
      my_comment = post.comments.first
      expect(page).to have_content(my_comment.author.name)
    end
  end
end
