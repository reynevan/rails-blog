require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have attributes :content, :user' do
    expect(subject.attributes).to include('content', 'user')
  end

  it 'should belong to user' do
    t = Comment.reflect_on_association(:user)
    expect(t.macro).to equal :belongs_to
  end

  it 'should belong to article' do
    t = Comment.reflect_on_association(:article)
    expect(t.macro).to equal :belongs_to
  end

  it 'should validate content and user_id presence' do
		expect(Comment.new(content:"")).not_to be_valid
    expect(Comment.new(content:"contentblabla", user_id: 1)).to be_valid
  end
end