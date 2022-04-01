require 'rails_helper'

describe 'Login page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Manful', photo: 'https://url/image', bio: 'Engineer', email: 'manf@gmail.com',
                         password: '123456', post_counter: 0, confirmed_at: Time.now)
  end

  it 'Show my log in page' do
    visit root_path
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Remember me'
  end

  it 'with wrong credentials' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'ma@gmail.com'
      fill_in 'Password', with: '12m456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'Login without fill password' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'manf@gmail.com'
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'Login with correct credentials' do
    @user = User.create(name: 'Manful', bio: 'Engineer', email: 'manf@gmail.com', password: '123456',
                        post_counter: 0, confirmed_at: Time.now)

    visit root_path
    within('body') do
      fill_in 'Email', with: 'manf@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Manful'
  end
end
