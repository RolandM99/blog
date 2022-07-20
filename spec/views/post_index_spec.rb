require 'rails_helper'

describe 'Posts page', type: :feature do
  before :each do
    first = User.create(name: 'Aku', photo: 'https://url/image', bio: 'Software Engineer', email: 'aku@example.com',
                        password: '123456', post_counter: 1, confirmed_at: Time.now)
    @sec = User.create(name: 'Zac', photo: 'https://url/image', bio: 'Software engineer', email: 'test1@example.com',
                       password: '123456', post_counter: 2, confirmed_at: Time.now)

    @first_post = Post.create(title: 'Sky is the limit', text: 'sky is the limit...', comment_counter: 0,
                              likes_counter: 0, author: first)
    @second_post = Post.create(title: 'On my way', text: 'to the moon...', comment_counter: 0, likes_counter: 0,
                               author: first)
    @third_post = Post.create(title: 'California love', text: 'Tupac Shakur on the flow...', comment_counter: 0,
                              likes_counter: 0, author: first)
    @first_comment = Comment.create(text: 'Put God First', author: User.first, post: Post.first)
  end

  it 'We can see username of the user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Aku'
  end

  it 'We can see the profile picture of the user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css("img[src*='https://icon-library.com/images/user-profile-icon/user-profile-icon-23.jpg']")
  end

  it 'We can see number of all posts' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    number_of_post = Post.all
    expect(number_of_post.size).to eql(3)
  end

  it 'We can see the number of comments' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 3'
  end

  it 'We can see the name of commnentator' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Aku'
  end
end
