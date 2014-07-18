require 'rails_helper'

RSpec.describe Article,type: :model do
	it 'should have attributes :title :content :user_id' do
    expect(subject.attributes).to include('title', 'content', 'user_id')
	end

	it 'should validate title presence' do
		expect(Article.new(title:"")).not_to be_valid
    expect(Article.new(title:"titleblabla", content:"contentblabla")).to be_valid
  end

  it 'should have many comments' do
  	t = Article.reflect_on_association(:comments)
  	expect(t.macro).to equal :has_many
  end

  it 'should belongs to user' do
  	t=Article.reflect_on_association(:user)
  	expect(t.macro).to equal :belongs_to
  end
end