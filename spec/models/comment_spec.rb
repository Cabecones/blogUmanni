require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is not valid without a post' do
    comment = described_class.new
    expect(comment).not_to be_valid
  end

  it 'is not valid without content' do
    comment = described_class.new
    expect(comment).not_to be_valid
  end

  it 'is not valid without a user' do
    comment = described_class.new
    expect(comment).not_to be_valid
  end
end
