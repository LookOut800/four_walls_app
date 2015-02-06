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


  scenario 'Create a post' do
    visit '/posts/new'

    fill_in 'Title', with: 'Brilliant Billiance'
    fill_in 'Body', with: "lorem ipsum ness"
    click_on 'Create Post'

    expect(page).to have_content(/success/i)
  end

   scenario 'Read a post' do
    post = Post.create!(title: 'Brilliant Posts', body: "HAPPY HAPPY job job")

    visit "/posts/#{post.id}"

    expect(page.find('h1')).to have_content 'Brilliant Posts'
    expect(page).to have_content "HAPPY HAPPY job job"
  end

  scenario 'Update a post' do
    post = Post.create!(title: 'Brilliant Posts', body: "HAPPY HAPPY job job")

    visit "posts/#{post.id}/edit"

    fill_in 'Title', with: 'Brilliant Posts'
    fill_in 'Body', with: 'HAPPY HAPPY job job'
    click_on 'Update Post'

    expect(page).to have_content(/success/i)
    expect(page.find('h1')).to have_content 'Brilliant Posts'
    expect(page).to have_content 'HAPPY HAPPY job job'
  end

end
