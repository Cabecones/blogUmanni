require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    post = build(:post)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it 'is not valid without content' do
    post = build(:post, content: nil)
    expect(post).not_to be_valid
  end
end
