require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo^X', bio: 'Teacher from Mexico.', post_counter: 2) }

  before { subject.save }

  it 'Name should be present' do
    subject.name = ''
    expect(User.new).to_not be_valid
  end

  it 'Post counter should be greater or equal to 0' do
    subject.post_counter = nil
    expect(User.new).to_not be_valid
  end

  it 'Post counter should be only an integer' do
    subject.post_counter = '2'
    expect(User.new).to_not be_valid
  end

  it 'Recent posts should render only 3 recent post' do
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end
end
