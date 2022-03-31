require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo^X', bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'Title should be present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'return all the comments for a post' do
    expect(Comment.count).to eql 0
  end

  it 'Retun 5 recent comments' do
    expect(subject.recent_comments).to eq(subject.comments.last(5))
  end

  it 'Should retun the update post' do
    expect(Post.count).to eq 0
  end
end
