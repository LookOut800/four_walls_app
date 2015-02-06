require 'rails_helper'

RSpec.feature 'Managing Posts' do
  scenario 'List all posts' do
    Post.destroy_all
    Post.create!(title: "First and only post", body: "This is the first image for this blog")
    Post.create!(title: "Second post", body: "This is the second image for this blog")
    Post.create!(title: "Third, Happy post", body: "This is the third image for this blog")

    visit '/posts'

    expect(page).to have_content 'Posts'
    expect(page).to have_selector 'post', count: 3
  end

end
