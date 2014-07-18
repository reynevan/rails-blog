require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'should have many comments' do
  	t = User.reflect_on_association(:comments)
  	expect(t.macro).to equal :has_many
  end

  it 'should have many articles' do
  	t = User.reflect_on_association(:articles)
  	expect(t.macro).to equal :has_many
  end

end
