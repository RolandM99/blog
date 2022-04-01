require 'rails_helper'

RSpec.describe 'Show user page', type: :feature do
  describe 'At this page We' do
    before(:each) do
      first = User.create(name: 'Aku', photo: 'https://url/image', bio: 'Software Engineer', email: 'aku@example.com',
                          password: '123456', post_counter: 1, confirmed_at: Time.now)
      @sec = User.create(name: 'Zac', photo: 'https://url/image', bio: 'Software engineer', email: 'test1@example.com',
                         password: '123456', post_counter: 2, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'test1@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      @first_post = Post.create(title: 'Sky is the limit', text: 'sky is the limit...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @second_post = Post.create(title: 'On my way', text: 'to the moon...', comment_counter: 0, likes_counter: 0,
                                 author: first)
      @third_post = Post.create(title: 'California love', text: 'Tupac Shakur on the flow...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @fourth_post = Post.create(title: 'My Engineer life', text: 'A day in the life of a software engineer...',
                                 comment_counter: 0, likes_counter: 0, author: first)
      visit user_path(first.id)
    end
    it 'Can show profile picture' do
      expect(page).to have_css("img[src*='https://icon-library.com/images/user-profile-icon/user-profile-icon-23.jpg']")
    end

    it "Can see user's username" do
      expect(page).to have_content 'Aku'
    end

    # it 'Can see the number of post' do
    #   @user = User.first
    #   expect(page).to have_content(@user.post_counter)
    # end

    it "Can see the user's bio" do
      expect(page).to have_content('Software Engineer')
      visit user_session_path
    end

    it 'Can a see a link to all posts of the user.' do
      expect(page).to have_link('See all posts')
    end

    # it 'Can see 3 first posts for a user' do
    #   expect(page).to have_content 'sky is the limit...'
    #   expect(page).to have_content 'to the moon...'
    #   expect(page).to have_content 'Tupac Shakur on the flow...'
    # end
  end
end
