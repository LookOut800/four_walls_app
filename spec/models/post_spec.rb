require 'rails_helper'

RSpec.describe Post do
  describe '.create' do
    it 'creates a new post' do
      expect(Post.create()).to be_a Post
    end
  end
end
