require 'rails_helper'

RSpec.feature 'Managing Comments' do
  scenario 'List all comments for a given post' do
    post = Post.create!(title: 'X-Files', body: "You want to believe")
    Comment.create!(body: 'Beauty is in the eye', post: post )
    Comment.create!(body: 'Beauty is in the eye', post: post )
    Comment.create!(body: 'Beauty is in the eye', post: post )

    visit "/post/#{post.id}"

    expect(page).to have_content 'Comments'
  end

  scenario 'Create a Comment' do
    post = Post.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    visit "/posts/#{post.id}/"

    fill_in 'Body', with: 'The truth is out there'
    click_on 'Create Comment'

    expect(page).to have_content(/success/i)
  end

  scenario 'Delete a Comment' do
    post = Post.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    visit "/posts/#{post.id}/"

    click_on 'Delete Comment'

    expect(page).to have_content(/success/i)
  end
end
