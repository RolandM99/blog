require 'rails_helper'

describe 'Index page for user', type: :feature do
  before :each do
    @user1 = User.create(name: 'Aku', photo: 'https://url/image', bio: 'Software Engineer', email: 'aku@example.com',
                         password: '123456', post_counter: 1, confirmed_at: Time.now)
    @user2 = User.create(name: 'Zac', photo: 'https://url/image', bio: 'Software engineer', email: 'test1@example.com',
                         password: '123456', post_counter: 2, confirmed_at: Time.now)
  end

  it 'Can see userma of all users' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Aku'
    expect(page).to have_content 'Zac'
  end

  it 'Can see number of posts' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'test1@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 0'
  end

  it 'Can see profile picture for each users' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'aku@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_css("img[src*='https://icon-library.com/images/user-profile-icon/user-profile-icon-23.jpg']")
  end
end
